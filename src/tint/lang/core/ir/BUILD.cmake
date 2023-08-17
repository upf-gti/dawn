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

include(lang/core/ir/transform/BUILD.cmake)

if(TINT_BUILD_IR)
tint_add_target("lang/core/ir"
  lang/core/ir/access.cc
  lang/core/ir/access.h
  lang/core/ir/binary.cc
  lang/core/ir/binary.h
  lang/core/ir/bitcast.cc
  lang/core/ir/bitcast.h
  lang/core/ir/block.cc
  lang/core/ir/block.h
  lang/core/ir/block_param.cc
  lang/core/ir/block_param.h
  lang/core/ir/break_if.cc
  lang/core/ir/break_if.h
  lang/core/ir/builder.cc
  lang/core/ir/builder.h
  lang/core/ir/builtin_call.cc
  lang/core/ir/builtin_call.h
  lang/core/ir/call.cc
  lang/core/ir/call.h
  lang/core/ir/constant.cc
  lang/core/ir/constant.h
  lang/core/ir/construct.cc
  lang/core/ir/construct.h
  lang/core/ir/continue.cc
  lang/core/ir/continue.h
  lang/core/ir/control_instruction.cc
  lang/core/ir/control_instruction.h
  lang/core/ir/convert.cc
  lang/core/ir/convert.h
  lang/core/ir/core_builtin_call.cc
  lang/core/ir/core_builtin_call.h
  lang/core/ir/disassembler.cc
  lang/core/ir/disassembler.h
  lang/core/ir/discard.cc
  lang/core/ir/discard.h
  lang/core/ir/exit.cc
  lang/core/ir/exit.h
  lang/core/ir/exit_if.cc
  lang/core/ir/exit_if.h
  lang/core/ir/exit_loop.cc
  lang/core/ir/exit_loop.h
  lang/core/ir/exit_switch.cc
  lang/core/ir/exit_switch.h
  lang/core/ir/function.cc
  lang/core/ir/function.h
  lang/core/ir/function_param.cc
  lang/core/ir/function_param.h
  lang/core/ir/if.cc
  lang/core/ir/if.h
  lang/core/ir/instruction.cc
  lang/core/ir/instruction.h
  lang/core/ir/instruction_result.cc
  lang/core/ir/instruction_result.h
  lang/core/ir/intrinsic_call.cc
  lang/core/ir/intrinsic_call.h
  lang/core/ir/let.cc
  lang/core/ir/let.h
  lang/core/ir/load.cc
  lang/core/ir/load.h
  lang/core/ir/load_vector_element.cc
  lang/core/ir/load_vector_element.h
  lang/core/ir/location.h
  lang/core/ir/loop.cc
  lang/core/ir/loop.h
  lang/core/ir/module.cc
  lang/core/ir/module.h
  lang/core/ir/multi_in_block.cc
  lang/core/ir/multi_in_block.h
  lang/core/ir/next_iteration.cc
  lang/core/ir/next_iteration.h
  lang/core/ir/operand_instruction.cc
  lang/core/ir/operand_instruction.h
  lang/core/ir/return.cc
  lang/core/ir/return.h
  lang/core/ir/store.cc
  lang/core/ir/store.h
  lang/core/ir/store_vector_element.cc
  lang/core/ir/store_vector_element.h
  lang/core/ir/switch.cc
  lang/core/ir/switch.h
  lang/core/ir/swizzle.cc
  lang/core/ir/swizzle.h
  lang/core/ir/terminate_invocation.cc
  lang/core/ir/terminate_invocation.h
  lang/core/ir/terminator.cc
  lang/core/ir/terminator.h
  lang/core/ir/unary.cc
  lang/core/ir/unary.h
  lang/core/ir/unreachable.cc
  lang/core/ir/unreachable.h
  lang/core/ir/user_call.cc
  lang/core/ir/user_call.h
  lang/core/ir/validator.cc
  lang/core/ir/validator.h
  lang/core/ir/value.cc
  lang/core/ir/value.h
  lang/core/ir/var.cc
  lang/core/ir/var.h
)

tint_target_add_dependencies("lang/core/ir"
  "api/common"
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

endif(TINT_BUILD_IR)
if(TINT_BUILD_IR)
tint_add_target("lang/core/ir:test"
  lang/core/ir/access_test.cc
  lang/core/ir/binary_test.cc
  lang/core/ir/bitcast_test.cc
  lang/core/ir/block_param_test.cc
  lang/core/ir/block_test.cc
  lang/core/ir/break_if_test.cc
  lang/core/ir/constant_test.cc
  lang/core/ir/construct_test.cc
  lang/core/ir/continue_test.cc
  lang/core/ir/convert_test.cc
  lang/core/ir/core_builtin_call_test.cc
  lang/core/ir/discard_test.cc
  lang/core/ir/exit_if_test.cc
  lang/core/ir/exit_loop_test.cc
  lang/core/ir/exit_switch_test.cc
  lang/core/ir/function_param_test.cc
  lang/core/ir/function_test.cc
  lang/core/ir/if_test.cc
  lang/core/ir/instruction_result_test.cc
  lang/core/ir/instruction_test.cc
  lang/core/ir/intrinsic_call_test.cc
  lang/core/ir/ir_helper_test.h
  lang/core/ir/let_test.cc
  lang/core/ir/load_test.cc
  lang/core/ir/load_vector_element_test.cc
  lang/core/ir/loop_test.cc
  lang/core/ir/module_test.cc
  lang/core/ir/multi_in_block_test.cc
  lang/core/ir/next_iteration_test.cc
  lang/core/ir/operand_instruction_test.cc
  lang/core/ir/return_test.cc
  lang/core/ir/store_test.cc
  lang/core/ir/store_vector_element_test.cc
  lang/core/ir/switch_test.cc
  lang/core/ir/swizzle_test.cc
  lang/core/ir/unary_test.cc
  lang/core/ir/user_call_test.cc
  lang/core/ir/validator_test.cc
  lang/core/ir/value_test.cc
  lang/core/ir/var_test.cc
)

tint_target_add_dependencies("lang/core/ir:test"
  "api/common"
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

tint_target_add_external_dependencies("lang/core/ir:test"
  "gtest"
)

if (TINT_BUILD_IR)
  tint_target_add_dependencies("lang/core/ir:test"
    "lang/core/ir"
  )
endif(TINT_BUILD_IR)

endif(TINT_BUILD_IR)