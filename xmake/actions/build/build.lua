--!A cross-platform build utility based on Lua
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
-- Copyright (C) 2015-present, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        build.lua
--

-- imports
import("core.base.option")
import("core.project.config")
import("core.project.project")
import("private.async.jobpool")
import("private.async.runjobs")
import("private.utils.batchcmds")
import("core.base.hashset")
import("private.service.remote_cache.client", {alias = "remote_cache_client"})
import("private.service.distcc_build.client", {alias = "distcc_build_client"})

-- clean target for rebuilding
function _clean_target(target)
    if target:targetfile() then
        os.tryrm(target:symbolfile())
        os.tryrm(target:targetfile())
    end
end

-- add batch jobs for rules
function _add_batchjobs_for_rules(batchjobs, rootjob, target, suffix)

    -- uses the rules script?
    local job, job_leaf
    for _, r in irpairs(target:orderules()) do -- reverse rules order for batchjobs:addjob()
        local scriptname = "build" .. (suffix and ("_" .. suffix) or "")
        local script = r:script(scriptname)
        if script then
            if r:extraconf(scriptname, "batch") then
                job, job_leaf = assert(script(target, batchjobs, {rootjob = job or rootjob}), "rule(%s):%s(): no returned job!", r:name(), scriptname)
            else
                job = batchjobs:addjob("rule/" .. r:name() .. "/" .. scriptname, function (index, total)
                    script(target, {progress = (index * 100) / total})
                end, {rootjob = job or rootjob})
            end
        else
            scriptname = "buildcmd" .. (suffix and ("_" .. suffix) or "")
            local buildcmd = r:script(scriptname)
            if buildcmd then
                job = batchjobs:addjob("rule/" .. r:name() .. "/" .. scriptname, function (index, total)
                    local batchcmds_ = batchcmds.new({target = target})
                    buildcmd(target, batchcmds_, {progress =  (index * 100) / total})
                    batchcmds_:runcmds({dryrun = option.get("dry-run")})
                end, {rootjob = job or rootjob})
            end
        end
    end
    return job, job_leaf or job
end

-- add builtin batch jobs
function _add_batchjobs_builtin(batchjobs, rootjob, target)

    -- add batchjobs for rules
    local job, job_leaf = _add_batchjobs_for_rules(batchjobs, rootjob, target)

    -- uses the builtin target script
    if not job and (target:is_static() or target:is_binary() or target:is_shared() or target:is_object()) then
        job, job_leaf = import("kinds." .. target:kind(), {anonymous = true})(batchjobs, rootjob, target)
    end
    job = job or rootjob
    return job, job_leaf or job
end

-- add batch jobs
function _add_batchjobs(batchjobs, rootjob, target)

    local job, job_leaf
    local script = target:script("build")
    if not script then
        -- do builtin batch jobs
        job, job_leaf = _add_batchjobs_builtin(batchjobs, rootjob, target)
    elseif target:extraconf("build", "batch") then
        -- do custom batch script
        -- e.g.
        -- target("test")
        --     on_build(function (target, batchjobs, opt)
        --         return batchjobs:addjob("test", function (idx, total)
        --             print("build it")
        --         end, {rootjob = opt.rootjob})
        --     end, {batch = true})
        --
        job, job_leaf = assert(script(target, batchjobs, {rootjob = rootjob}), "target(%s):on_build(): no returned job!", target:name())
    else
        -- do custom script directly
        -- e.g.
        --
        -- target("test")
        --     on_build(function (target, opt)
        --         print("build it")
        --     end)
        --
        job = batchjobs:addjob(target:name() .. "/build", function (index, total)
            script(target, {progress = (index * 100) / total})
        end, {rootjob = rootjob})
    end
    return job, job_leaf or job
end

-- add batch jobs for the given target
function _add_batchjobs_for_target(batchjobs, rootjob, target)

    -- has been disabled?
    if not target:is_enabled() then
        return
    end

    -- add after_build job for target
    local oldenvs
    local job_build_after = batchjobs:addjob(target:name() .. "/after_build", function (index, total)

        -- do after_build
        local progress = (index * 100) / total
        local after_build = target:script("build_after")
        if after_build then
            after_build(target, {progress = progress})
        end

        -- restore environments
        if oldenvs then
            os.setenvs(oldenvs)
        end

    end, {rootjob = rootjob})

    -- add batchjobs for rules/build_after
    local rules_job_build_after, rules_job_build_after_leaf = _add_batchjobs_for_rules(batchjobs, job_build_after, target, "after")

    -- add batch jobs for target, @note only on_build script support batch jobs
    local job_build, job_build_leaf = _add_batchjobs(batchjobs, rules_job_build_after_leaf or job_build_after, target)

    -- add batchjobs for rules/build_before
    local rules_job_build_before, rules_job_build_before_leaf = _add_batchjobs_for_rules(batchjobs, job_build_leaf, target, "before")

    -- add before_build job for target
    local job_build_before = batchjobs:addjob(target:name() .. "/before_build", function (index, total)

        -- enter package environments
        oldenvs = os.addenvs(target:pkgenvs())

        -- clean target if rebuild
        if option.get("rebuild") and not option.get("dry-run") then
            _clean_target(target)
        end

        -- do before_build
        local progress = (index * 100) / total
        local before_build = target:script("build_before")
        if before_build then
            before_build(target, {progress = progress})
        end
    end, {rootjob = rules_job_build_before_leaf or job_build_leaf})
    return job_build_before, job_build, job_build_after
end

-- add batch jobs for the given target and deps
function _add_batchjobs_for_target_and_deps(batchjobs, rootjob, jobrefs, target)
    local targetjob_ref = jobrefs[target:name()]
    if targetjob_ref then
        batchjobs:add(targetjob_ref, rootjob)
    else
        local job_build_before, job_build, job_build_after = _add_batchjobs_for_target(batchjobs, rootjob, target)
        if job_build_before and job_build and job_build_after then
            jobrefs[target:name()] = job_build_after
            for _, depname in ipairs(target:get("deps")) do
                local dep = project.target(depname)
                local targetjob = job_build
                -- @see https://github.com/xmake-io/xmake/discussions/2500
                if dep:policy("build.across_targets_in_parallel") == false then
                    targetjob = job_build_before
                end
                _add_batchjobs_for_target_and_deps(batchjobs, targetjob, jobrefs, dep)
            end
        end
    end
end

-- get batch jobs, @note we need export it for private.diagnosis.dump_buildjobs
function get_batchjobs(targetname, group_pattern)

    -- get root targets
    local targets_root = {}
    if targetname then
        table.insert(targets_root, project.target(targetname))
    else
        local depset = hashset.new()
        local targets = {}
        for _, target in pairs(project.targets()) do
            local group = target:get("group")
            if (target:is_default() and not group_pattern) or option.get("all") or (group_pattern and group and group:match(group_pattern)) then
                for _, depname in ipairs(target:get("deps")) do
                    depset:insert(depname)
                end
                table.insert(targets, target)
            end
        end
        for _, target in pairs(targets) do
            if not depset:has(target:name()) then
                table.insert(targets_root, target)
            end
        end
    end

    -- generate batch jobs for default or all targets
    local jobrefs = {}
    local batchjobs = jobpool.new()
    for _, target in pairs(targets_root) do
        _add_batchjobs_for_target_and_deps(batchjobs, batchjobs:rootjob(), jobrefs, target)
    end
    return batchjobs
end

-- the main entry
function main(targetname, group_pattern)

    -- enable distcc?
    local distcc
    if distcc_build_client.is_connected() then
        distcc = distcc_build_client.singleton()
    end

    -- build all jobs
    local batchjobs = get_batchjobs(targetname, group_pattern)
    if batchjobs and batchjobs:size() > 0 then
        local curdir = os.curdir()
        runjobs("build", batchjobs, {on_exit = function (errors)
            import("utils.progress")
            if errors and progress.showing_without_scroll() then
                print("")
            end
        end, comax = option.get("jobs") or 1, curdir = curdir, count_as_index = true, distcc = distcc})
        os.cd(curdir)
    end
end



