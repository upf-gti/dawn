# Copyright 2023 The Tint Authors.
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

################################################################################
# File generated by tools/src/cmd/gen
# using the template:
#   tools/src/cmd/gen/build/BUILD.cmake.tmpl
#
# Do not modify this file directly
################################################################################

################################################################################
# CMake target: 'tint_cmd_common'
################################################################################
tint_add_target("cmd/common"
  cmd/common/generate_external_texture_bindings.cc
  cmd/common/generate_external_texture_bindings.h
  cmd/common/helper.cc
  cmd/common/helper.h
)

tint_target_add_dependencies("cmd/common"
  "api/common"
  "api/options"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/spirv/reader/common"
  "lang/wgsl/ast"
  "lang/wgsl/inspector"
  "lang/wgsl/program"
  "lang/wgsl/reader"
  "lang/wgsl/sem"
  "lang/wgsl/writer"
  "utils/containers"
  "utils/diagnostic"
  "utils/ice"
  "utils/id"
  "utils/macros"
  "utils/math"
  "utils/memory"
  "utils/reflection"
  "utils/result"
  "utils/rtti"
  "utils/symbol"
  "utils/text"
  "utils/traits"
)

if (TINT_BUILD_SPV_READER)
  tint_target_add_dependencies("cmd/common"
    "lang/spirv/reader"
  )
endif(TINT_BUILD_SPV_READER)

if (TINT_BUILD_SPV_READER  OR  TINT_BUILD_SPV_WRITER)
  tint_target_add_external_dependencies("cmd/common"
    "spirv-tools"
  )
endif(TINT_BUILD_SPV_READER  OR  TINT_BUILD_SPV_WRITER)

################################################################################
# CMake target: 'tint_cmd_common_test'
################################################################################
tint_add_target("cmd/common:test"
  cmd/common/generate_external_texture_bindings_test.cc
)

tint_target_add_dependencies("cmd/common:test"
  "api/common"
  "api/options"
  "cmd/common"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/wgsl/ast"
  "lang/wgsl/program"
  "lang/wgsl/resolver"
  "lang/wgsl/sem"
  "utils/containers"
  "utils/diagnostic"
  "utils/ice"
  "utils/id"
  "utils/macros"
  "utils/math"
  "utils/memory"
  "utils/reflection"
  "utils/result"
  "utils/rtti"
  "utils/symbol"
  "utils/text"
  "utils/traits"
)

tint_target_add_external_dependencies("cmd/common:test"
  "gtest"
)
