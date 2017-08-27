--!A cross-platform build utility based on Lua
--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015 - 2017, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        ls_remote.lua
--

-- imports
import("core.base.option")
import("detect.tools.find_git")

-- ls_remote to given branch, tag or commit
--
-- @param reftype   the reference type, "tags", "heads" and "refs"
-- @param url       the remote url, optional
--
-- @return          the tags, heads or refs
--
-- @code
--
-- import("devel.git")
-- 
-- local tags   = git.ls_remote("tags", url)
-- local heads  = git.ls_remote("heads", url)
-- local refs   = git.ls_remote("refs")
--
-- @endcode
--
function main(reftype, url)

    -- find git
    local program = find_git()
    if not program then
        return {}
    end

    -- init reference type
    reftype = reftype or "refs"

    -- get refs
    local data = os.iorunv(program, {"ls-remote", "--" .. reftype, url or "."})

    -- get commmits and tags
    local refs = {}
    for _, line in ipairs(data:split('\n')) do

        -- parse commit and ref
        local refinfo = line:split('%s+')

        -- get commit 
        local commit = refinfo[1]

        -- get ref
        local ref = refinfo[2]

        -- save this ref
        local prefix = ifelse(reftype == "refs", "refs/", "refs/" .. reftype .. "/")
        if ref and ref:startswith(prefix) and commit and #commit == 40 then
            table.insert(refs, ref:sub(#prefix + 1))
        end
    end

    -- ok
    return refs
end
