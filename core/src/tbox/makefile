# prefix
include $(PRO_DIR)/prefix.mak

# module name
NAMES 					= tbox

# module type
tbox_TYPE 				= LIB

# config
tbox_CONFIG 			= n

# core files
tbox_C_FILES 			+= \
						tbox/src/tbox/tbox \
						tbox/src/tbox/hash/md5 \
						tbox/src/tbox/hash/bkdr \
						tbox/src/tbox/hash/fnv32 \
						tbox/src/tbox/hash/adler32 \
						tbox/src/tbox/math/impl/math \
						tbox/src/tbox/math/random/linear \
						tbox/src/tbox/math/random/random \
						tbox/src/tbox/libc/impl/libc \
						tbox/src/tbox/libc/misc/time/gmmktime \
						tbox/src/tbox/libc/misc/time/gmtime \
						tbox/src/tbox/libc/misc/time/localtime \
						tbox/src/tbox/libc/misc/time/mktime \
						tbox/src/tbox/libc/misc/time/time \
						tbox/src/tbox/libc/stdio/printf \
						tbox/src/tbox/libc/stdio/printf_object \
						tbox/src/tbox/libc/stdio/puts \
						tbox/src/tbox/libc/stdio/snprintf \
						tbox/src/tbox/libc/stdio/sprintf \
						tbox/src/tbox/libc/stdio/swprintf \
						tbox/src/tbox/libc/stdio/vsnprintf \
						tbox/src/tbox/libc/stdio/vswprintf \
						tbox/src/tbox/libc/stdio/wprintf \
						tbox/src/tbox/libc/stdio/wputs \
						tbox/src/tbox/libc/stdlib/mbstowcs \
						tbox/src/tbox/libc/stdlib/random \
						tbox/src/tbox/libc/stdlib/stdlib \
						tbox/src/tbox/libc/stdlib/wcstombs \
						tbox/src/tbox/libc/string/memcmp \
						tbox/src/tbox/libc/string/memcpy \
						tbox/src/tbox/libc/string/memdup \
						tbox/src/tbox/libc/string/memmem \
						tbox/src/tbox/libc/string/memmov \
						tbox/src/tbox/libc/string/memset \
						tbox/src/tbox/libc/string/strcat \
						tbox/src/tbox/libc/string/strchr \
						tbox/src/tbox/libc/string/strnchr \
						tbox/src/tbox/libc/string/strcmp \
						tbox/src/tbox/libc/string/strcpy \
						tbox/src/tbox/libc/string/strdup \
						tbox/src/tbox/libc/string/strichr \
						tbox/src/tbox/libc/string/stricmp \
						tbox/src/tbox/libc/string/strirchr \
						tbox/src/tbox/libc/string/strirstr \
						tbox/src/tbox/libc/string/stristr \
						tbox/src/tbox/libc/string/strlcpy \
						tbox/src/tbox/libc/string/strlen \
						tbox/src/tbox/libc/string/strncat \
						tbox/src/tbox/libc/string/strncmp \
						tbox/src/tbox/libc/string/strncpy \
						tbox/src/tbox/libc/string/strndup \
						tbox/src/tbox/libc/string/strnicmp \
						tbox/src/tbox/libc/string/strnirchr \
						tbox/src/tbox/libc/string/strnirstr \
						tbox/src/tbox/libc/string/strnistr \
						tbox/src/tbox/libc/string/strnlen \
						tbox/src/tbox/libc/string/strnrchr \
						tbox/src/tbox/libc/string/strnrstr \
						tbox/src/tbox/libc/string/strnstr \
						tbox/src/tbox/libc/string/strrchr \
						tbox/src/tbox/libc/string/strrstr \
						tbox/src/tbox/libc/string/strstr \
						tbox/src/tbox/libc/string/wcscat \
						tbox/src/tbox/libc/string/wcschr \
						tbox/src/tbox/libc/string/wcscmp \
						tbox/src/tbox/libc/string/wcscpy \
						tbox/src/tbox/libc/string/wcsdup \
						tbox/src/tbox/libc/string/wcsichr \
						tbox/src/tbox/libc/string/wcsicmp \
						tbox/src/tbox/libc/string/wcsirchr \
						tbox/src/tbox/libc/string/wcsirstr \
						tbox/src/tbox/libc/string/wcsistr \
						tbox/src/tbox/libc/string/wcslcpy \
						tbox/src/tbox/libc/string/wcslen \
						tbox/src/tbox/libc/string/wcsncat \
						tbox/src/tbox/libc/string/wcsncmp \
						tbox/src/tbox/libc/string/wcsncpy \
						tbox/src/tbox/libc/string/wcsndup \
						tbox/src/tbox/libc/string/wcsnicmp \
						tbox/src/tbox/libc/string/wcsnirchr \
						tbox/src/tbox/libc/string/wcsnirstr \
						tbox/src/tbox/libc/string/wcsnlen \
						tbox/src/tbox/libc/string/wcsnrchr \
						tbox/src/tbox/libc/string/wcsnrstr \
						tbox/src/tbox/libc/string/wcsrchr \
						tbox/src/tbox/libc/string/wcsrstr \
						tbox/src/tbox/libc/string/wcsstr \
						tbox/src/tbox/utils/base32 \
						tbox/src/tbox/utils/base64 \
						tbox/src/tbox/utils/bits \
						tbox/src/tbox/utils/dump \
						tbox/src/tbox/utils/lock_profiler \
						tbox/src/tbox/utils/singleton \
						tbox/src/tbox/utils/trace \
						tbox/src/tbox/utils/url \
						tbox/src/tbox/utils/used \
						tbox/src/tbox/prefix/state \
						tbox/src/tbox/memory/allocator \
						tbox/src/tbox/memory/buffer \
						tbox/src/tbox/memory/default_allocator \
						tbox/src/tbox/memory/fixed_pool \
						tbox/src/tbox/memory/impl/memory \
						tbox/src/tbox/memory/impl/native_large_allocator \
						tbox/src/tbox/memory/impl/prefix \
						tbox/src/tbox/memory/impl/static_fixed_pool \
						tbox/src/tbox/memory/impl/static_large_allocator \
						tbox/src/tbox/memory/large_allocator \
						tbox/src/tbox/memory/native_allocator \
						tbox/src/tbox/memory/queue_buffer \
						tbox/src/tbox/memory/small_allocator \
						tbox/src/tbox/memory/static_allocator \
						tbox/src/tbox/memory/static_buffer \
						tbox/src/tbox/memory/string_pool \
						tbox/src/tbox/string/static_string \
						tbox/src/tbox/string/string \
						tbox/src/tbox/stream/filter \
						tbox/src/tbox/stream/impl/filter/cache \
						tbox/src/tbox/stream/impl/filter/chunked \
						tbox/src/tbox/stream/impl/filter/charset \
						tbox/src/tbox/stream/impl/stream/data \
						tbox/src/tbox/stream/impl/stream/file \
						tbox/src/tbox/stream/impl/stream/filter \
						tbox/src/tbox/stream/impl/stream/http \
						tbox/src/tbox/stream/impl/stream/sock \
						tbox/src/tbox/stream/static_stream \
						tbox/src/tbox/stream/stream \
						tbox/src/tbox/stream/transfer \
						tbox/src/tbox/network/cookies \
						tbox/src/tbox/network/dns/cache \
						tbox/src/tbox/network/dns/looker \
						tbox/src/tbox/network/dns/server \
						tbox/src/tbox/network/http \
						tbox/src/tbox/network/hwaddr \
						tbox/src/tbox/network/impl/http/date \
						tbox/src/tbox/network/impl/http/method \
						tbox/src/tbox/network/impl/http/option \
						tbox/src/tbox/network/impl/http/status \
						tbox/src/tbox/network/impl/network \
						tbox/src/tbox/network/unixaddr \
						tbox/src/tbox/network/ipaddr \
						tbox/src/tbox/network/ipv4 \
						tbox/src/tbox/network/ipv6 \
						tbox/src/tbox/network/url \
						tbox/src/tbox/algorithm/binary_find \
						tbox/src/tbox/algorithm/binary_find_if \
						tbox/src/tbox/algorithm/bubble_sort \
						tbox/src/tbox/algorithm/count \
						tbox/src/tbox/algorithm/count_if \
						tbox/src/tbox/algorithm/distance \
						tbox/src/tbox/algorithm/find \
						tbox/src/tbox/algorithm/find_if \
						tbox/src/tbox/algorithm/heap_sort \
						tbox/src/tbox/algorithm/insert_sort \
						tbox/src/tbox/algorithm/predicate \
						tbox/src/tbox/algorithm/quick_sort \
						tbox/src/tbox/algorithm/remove \
						tbox/src/tbox/algorithm/remove_first \
						tbox/src/tbox/algorithm/remove_first_if \
						tbox/src/tbox/algorithm/remove_if \
						tbox/src/tbox/algorithm/rfind \
						tbox/src/tbox/algorithm/rfind_if \
						tbox/src/tbox/algorithm/rwalk \
						tbox/src/tbox/algorithm/sort \
						tbox/src/tbox/algorithm/walk \
						tbox/src/tbox/container/bloom_filter \
						tbox/src/tbox/container/circle_queue \
						tbox/src/tbox/container/element/hash \
						tbox/src/tbox/container/element/long \
						tbox/src/tbox/container/element/mem \
						tbox/src/tbox/container/element/null \
						tbox/src/tbox/container/element/ptr \
						tbox/src/tbox/container/element/size \
						tbox/src/tbox/container/element/str \
						tbox/src/tbox/container/element/true \
						tbox/src/tbox/container/element/uint16 \
						tbox/src/tbox/container/element/uint32 \
						tbox/src/tbox/container/element/uint8 \
						tbox/src/tbox/container/hash_map \
						tbox/src/tbox/container/hash_set \
						tbox/src/tbox/container/heap \
						tbox/src/tbox/container/array_iterator \
						tbox/src/tbox/container/iterator \
						tbox/src/tbox/container/list \
						tbox/src/tbox/container/list_entry \
						tbox/src/tbox/container/priority_queue \
						tbox/src/tbox/container/queue \
						tbox/src/tbox/container/single_list \
						tbox/src/tbox/container/single_list_entry \
						tbox/src/tbox/container/stack \
						tbox/src/tbox/container/vector \
						tbox/src/tbox/libm/impl/libm \
						tbox/src/tbox/libm/exp \
						tbox/src/tbox/libm/ilog2i \
						tbox/src/tbox/libm/isqrti \
						tbox/src/tbox/libm/idivi8 \
						tbox/src/tbox/platform/addrinfo \
						tbox/src/tbox/platform/atomic64 \
						tbox/src/tbox/platform/backtrace \
						tbox/src/tbox/platform/cache_time \
						tbox/src/tbox/platform/directory \
						tbox/src/tbox/platform/dynamic \
						tbox/src/tbox/platform/environment \
						tbox/src/tbox/platform/event \
						tbox/src/tbox/platform/file \
						tbox/src/tbox/platform/filelock \
						tbox/src/tbox/platform/hostname \
						tbox/src/tbox/platform/ifaddrs \
						tbox/src/tbox/platform/ltimer \
						tbox/src/tbox/platform/native_memory \
						tbox/src/tbox/platform/virtual_memory \
						tbox/src/tbox/platform/mutex \
						tbox/src/tbox/platform/page \
						tbox/src/tbox/platform/path \
						tbox/src/tbox/platform/poller \
						tbox/src/tbox/platform/print \
						tbox/src/tbox/platform/stdfile \
						tbox/src/tbox/platform/process \
						tbox/src/tbox/platform/fwatcher \
						tbox/src/tbox/platform/cpu \
						tbox/src/tbox/platform/sched \
						tbox/src/tbox/platform/semaphore \
						tbox/src/tbox/platform/pipe \
						tbox/src/tbox/platform/socket \
						tbox/src/tbox/platform/syserror \
						tbox/src/tbox/platform/thread \
						tbox/src/tbox/platform/thread_local \
						tbox/src/tbox/platform/time \
						tbox/src/tbox/platform/timer \
						tbox/src/tbox/platform/impl/charset \
						tbox/src/tbox/platform/impl/pollerdata \
						tbox/src/tbox/platform/impl/dns \
						tbox/src/tbox/platform/impl/platform \
						tbox/src/tbox/libm/isfin \
						tbox/src/tbox/libm/isfinf \
						tbox/src/tbox/libm/isinf \
						tbox/src/tbox/libm/isinff \
						tbox/src/tbox/libm/isnan \
						tbox/src/tbox/libm/isnanf \
						tbox/src/tbox/libm/pow \
						tbox/src/tbox/libm/cos \
						tbox/src/tbox/libm/cosf \
						tbox/src/tbox/libm/sqrtf \
						tbox/src/tbox/hash/sha \
						tbox/src/tbox/hash/uuid \
						tbox/src/tbox/charset/charset \
						tbox/src/tbox/charset/ascii \
						tbox/src/tbox/charset/gb2312 \
						tbox/src/tbox/charset/utf8 \
						tbox/src/tbox/charset/utf16 \
						tbox/src/tbox/charset/utf32 \
						tbox/src/tbox/charset/ucs2 \
						tbox/src/tbox/charset/ucs4 \
						tbox/src/tbox/charset/iso8859

iswin =
ifeq ($(PLAT),windows)
	iswin = yes
endif
ifeq ($(PLAT),msys)
	iswin = yes
endif
ifeq ($(PLAT),mingw)
	iswin = yes
endif
ifeq ($(PLAT),cygwin)
	iswin = yes
endif

ifdef iswin
tbox_C_FILES 			+= \
						tbox/src/tbox/platform/windows/windows \
						tbox/src/tbox/platform/windows/iocp_object \
						tbox/src/tbox/platform/windows/socket_pool \
						tbox/src/tbox/platform/windows/interface/ws2_32 \
						tbox/src/tbox/platform/windows/interface/shell32 \
						tbox/src/tbox/platform/windows/interface/dbghelp \
						tbox/src/tbox/platform/windows/interface/mswsock \
						tbox/src/tbox/platform/windows/interface/kernel32 \
						tbox/src/tbox/platform/windows/interface/iphlpapi \
						tbox/src/tbox/platform/windows/interface/interface
endif
ifeq ($(PLAT),iphoneos)
tbox_M_FILES 			+= \
						tbox/src/tbox/platform/mach/ios/directory
endif

# includes
tbox_INC_DIRS 			+= \
						tbox/src \
						inc/$(PLAT)

# use system tbox library?
tbox_C_FILES 			:= $(if $(findstring tbox,$(base_LIBNAMES)),,$(tbox_C_FILES))
tbox_M_FILES 			:= $(if $(findstring tbox,$(base_LIBNAMES)),,$(tbox_M_FILES))
tbox_INC_FILES 			:= $(if $(findstring tbox,$(base_LIBNAMES)),,$(tbox_INC_FILES))


# suffix
include $(PRO_DIR)/suffix.mak

