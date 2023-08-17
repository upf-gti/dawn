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
# CMake target: 'tint_lang_wgsl_helpers'
################################################################################
tint_add_target("lang/wgsl/helpers"
  lang/wgsl/helpers/append_vector.cc
  lang/wgsl/helpers/append_vector.h
  lang/wgsl/helpers/check_supported_extensions.cc
  lang/wgsl/helpers/check_supported_extensions.h
  lang/wgsl/helpers/flatten_bindings.cc
  lang/wgsl/helpers/flatten_bindings.h
)

tint_target_add_dependencies("lang/wgsl/helpers"
  "api/common"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/wgsl/ast"
  "lang/wgsl/ast/transform"
  "lang/wgsl/inspector"
  "lang/wgsl/program"
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

################################################################################
# CMake target: 'tint_lang_wgsl_helpers_test'
################################################################################
tint_add_target("lang/wgsl/helpers:test"
  lang/wgsl/helpers/append_vector_test.cc
  lang/wgsl/helpers/check_supported_extensions_test.cc
  lang/wgsl/helpers/flatten_bindings_test.cc
  lang/wgsl/helpers/ir_program_test.h
)

tint_target_add_dependencies("lang/wgsl/helpers:test"
  "api/common"
  "lang/core"
  "lang/core/constant"
  "lang/core/intrinsic"
  "lang/core/type"
  "lang/wgsl/ast"
  "lang/wgsl/ast:test"
  "lang/wgsl/helpers"
  "lang/wgsl/program"
  "lang/wgsl/reader"
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

tint_target_add_external_dependencies("lang/wgsl/helpers:test"
  "gtest"
)

if (TINT_BUILD_IR)
  tint_target_add_dependencies("lang/wgsl/helpers:test"
    "lang/core/ir"
    "lang/wgsl/reader/program_to_ir"
  )
endif(TINT_BUILD_IR)
