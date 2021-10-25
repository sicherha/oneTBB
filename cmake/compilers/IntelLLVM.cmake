# Copyright (c) 2020-2021 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if (MSVC)
    include(${CMAKE_CURRENT_LIST_DIR}/MSVC.cmake)

    set(TBB_OPENMP_FLAG /Qiopenmp)

    set(TBB_IPO_COMPILE_FLAGS $<$<NOT:$<CONFIG:Debug>>:/Qipo>)
    set(TBB_IPO_LINK_FLAGS $<$<NOT:$<CONFIG:Debug>>:/INCREMENTAL:NO>)
else()
    include(${CMAKE_CURRENT_LIST_DIR}/Clang.cmake)

    set(TBB_LIB_LINK_FLAGS ${TBB_LIB_LINK_FLAGS} -static-intel)

    set(TBB_IPO_COMPILE_FLAGS $<$<NOT:$<CONFIG:Debug>>:-ipo>)
endif()
set(TBB_IPO_LINK_FLAGS ${TBB_IPO_LINK_FLAGS} ${TBB_IPO_COMPILE_FLAGS})
