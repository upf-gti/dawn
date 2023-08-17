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

include(lang/spirv/writer/ast_printer/BUILD.cmake)
include(lang/spirv/writer/common/BUILD.cmake)
include(lang/spirv/writer/printer/BUILD.cmake)
include(lang/spirv/writer/raise/BUILD.cmake)

if(TINT_BUILD_SPV_WRITER)
################################################################################
# CMake target: 'tint_lang_spirv_writer'
################################################################################
tint_add_target("lang/spirv/writer"
  lang/spirv/writer/output.h
  lang/spirv/writer/writer.cc
  lang/spirv/writer/writer.h
)

tint_target_add_dependencies("lang/spirv/writer"
  "api/common"
  "api/options"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/wgsl/ast"
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

if (TINT_BUILD_IR)
  tint_target_add_dependencies("lang/spirv/writer"
    "lang/core/ir"
    "lang/core/ir/transform"
    "lang/wgsl/reader/program_to_ir"
  )
endif(TINT_BUILD_IR)

if (TINT_BUILD_SPV_READER  OR  TINT_BUILD_SPV_WRITER)
  tint_target_add_external_dependencies("lang/spirv/writer"
    "spirv-headers"
  )
endif(TINT_BUILD_SPV_READER  OR  TINT_BUILD_SPV_WRITER)

if (TINT_BUILD_SPV_WRITER)
  tint_target_add_dependencies("lang/spirv/writer"
    "lang/spirv/writer/ast_printer"
    "lang/spirv/writer/common"
  )
endif(TINT_BUILD_SPV_WRITER)

if (TINT_BUILD_SPV_WRITER  AND  TINT_BUILD_IR)
  tint_target_add_dependencies("lang/spirv/writer"
    "lang/spirv/writer/printer"
    "lang/spirv/writer/raise"
  )
endif(TINT_BUILD_SPV_WRITER  AND  TINT_BUILD_IR)

endif(TINT_BUILD_SPV_WRITER)
if(TINT_BUILD_SPV_WRITER)
################################################################################
# CMake target: 'tint_lang_spirv_writer_test'
################################################################################
tint_add_target("lang/spirv/writer:test"
)

tint_target_add_dependencies("lang/spirv/writer:test"
  "api/common"
  "api/options"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
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

tint_target_add_external_dependencies("lang/spirv/writer:test"
  "gtest"
)

if (TINT_BUILD_IR)
  tint_target_add_sources("lang/spirv/writer:test"
    "lang/spirv/writer/access_test.cc"
    "lang/spirv/writer/atomic_builtin_test.cc"
    "lang/spirv/writer/binary_test.cc"
    "lang/spirv/writer/bitcast_test.cc"
    "lang/spirv/writer/builtin_test.cc"
    "lang/spirv/writer/constant_test.cc"
    "lang/spirv/writer/construct_test.cc"
    "lang/spirv/writer/convert_test.cc"
    "lang/spirv/writer/discard_test.cc"
    "lang/spirv/writer/function_test.cc"
    "lang/spirv/writer/if_test.cc"
    "lang/spirv/writer/let_test.cc"
    "lang/spirv/writer/loop_test.cc"
    "lang/spirv/writer/switch_test.cc"
    "lang/spirv/writer/swizzle_test.cc"
    "lang/spirv/writer/texture_builtin_test.cc"
    "lang/spirv/writer/type_test.cc"
    "lang/spirv/writer/unary_test.cc"
    "lang/spirv/writer/var_test.cc"
    "lang/spirv/writer/writer_test.cc"
  )
  tint_target_add_dependencies("lang/spirv/writer:test"
    "lang/core/ir"
  )
endif(TINT_BUILD_IR)

if (TINT_BUILD_SPV_READER  OR  TINT_BUILD_SPV_WRITER)
  tint_target_add_external_dependencies("lang/spirv/writer:test"
    "spirv-headers"
    "spirv-tools"
  )
endif(TINT_BUILD_SPV_READER  OR  TINT_BUILD_SPV_WRITER)

if (TINT_BUILD_SPV_WRITER)
  tint_target_add_dependencies("lang/spirv/writer:test"
    "lang/spirv/writer/common"
    "lang/spirv/writer/common:test"
  )
endif(TINT_BUILD_SPV_WRITER)

if (TINT_BUILD_SPV_WRITER  AND  TINT_BUILD_IR)
  tint_target_add_dependencies("lang/spirv/writer:test"
    "lang/spirv/writer/printer"
    "lang/spirv/writer/raise"
  )
endif(TINT_BUILD_SPV_WRITER  AND  TINT_BUILD_IR)

endif(TINT_BUILD_SPV_WRITER)
if(TINT_BUILD_SPV_WRITER)
################################################################################
# CMake target: 'tint_lang_spirv_writer_bench'
################################################################################
tint_add_target("lang/spirv/writer:bench"
)

tint_target_add_dependencies("lang/spirv/writer:bench"
  "api/common"
  "api/options"
  "cmd/bench"
  "lang/core"
  "lang/core/constant"
  "lang/core/type"
  "lang/wgsl/ast"
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

if (TINT_BUILD_IR)
  tint_target_add_sources("lang/spirv/writer:bench"
    "lang/spirv/writer/writer_bench.cc"
  )
endif(TINT_BUILD_IR)

if (TINT_BUILD_SPV_WRITER)
  tint_target_add_dependencies("lang/spirv/writer:bench"
    "lang/spirv/writer"
    "lang/spirv/writer/common"
  )
endif(TINT_BUILD_SPV_WRITER)

endif(TINT_BUILD_SPV_WRITER)