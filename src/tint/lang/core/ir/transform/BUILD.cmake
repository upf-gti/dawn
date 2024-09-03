# Copyright 2023 The Dawn & Tint Authors
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

################################################################################
# File generated by 'tools/src/cmd/gen' using the template:
#   tools/src/cmd/gen/build/BUILD.cmake.tmpl
#
# To regenerate run: './tools/run gen'
#
#                       Do not modify this file directly
################################################################################

include(lang/core/ir/transform/common/BUILD.cmake)

################################################################################
# Target:    tint_lang_core_ir_transform
# Kind:      lib
################################################################################
tint_add_target(tint_lang_core_ir_transform lib
  lang/core/ir/transform/add_empty_entry_point.cc
  lang/core/ir/transform/add_empty_entry_point.h
  lang/core/ir/transform/array_length_from_uniform.cc
  lang/core/ir/transform/array_length_from_uniform.h
  lang/core/ir/transform/bgra8unorm_polyfill.cc
  lang/core/ir/transform/bgra8unorm_polyfill.h
  lang/core/ir/transform/binary_polyfill.cc
  lang/core/ir/transform/binary_polyfill.h
  lang/core/ir/transform/binding_remapper.cc
  lang/core/ir/transform/binding_remapper.h
  lang/core/ir/transform/block_decorated_structs.cc
  lang/core/ir/transform/block_decorated_structs.h
  lang/core/ir/transform/builtin_polyfill.cc
  lang/core/ir/transform/builtin_polyfill.h
  lang/core/ir/transform/combine_access_instructions.cc
  lang/core/ir/transform/combine_access_instructions.h
  lang/core/ir/transform/conversion_polyfill.cc
  lang/core/ir/transform/conversion_polyfill.h
  lang/core/ir/transform/demote_to_helper.cc
  lang/core/ir/transform/demote_to_helper.h
  lang/core/ir/transform/direct_variable_access.cc
  lang/core/ir/transform/direct_variable_access.h
  lang/core/ir/transform/multiplanar_external_texture.cc
  lang/core/ir/transform/multiplanar_external_texture.h
  lang/core/ir/transform/preserve_padding.cc
  lang/core/ir/transform/preserve_padding.h
  lang/core/ir/transform/remove_continue_in_switch.cc
  lang/core/ir/transform/remove_continue_in_switch.h
  lang/core/ir/transform/remove_terminator_args.cc
  lang/core/ir/transform/remove_terminator_args.h
  lang/core/ir/transform/rename_conflicts.cc
  lang/core/ir/transform/rename_conflicts.h
  lang/core/ir/transform/robustness.cc
  lang/core/ir/transform/robustness.h
  lang/core/ir/transform/shader_io.cc
  lang/core/ir/transform/shader_io.h
  lang/core/ir/transform/std140.cc
  lang/core/ir/transform/std140.h
  lang/core/ir/transform/value_to_let.cc
  lang/core/ir/transform/value_to_let.h
  lang/core/ir/transform/vectorize_scalar_matrix_constructors.cc
  lang/core/ir/transform/vectorize_scalar_matrix_constructors.h
  lang/core/ir/transform/zero_init_workgroup_memory.cc
  lang/core/ir/transform/zero_init_workgroup_memory.h
)

tint_target_add_dependencies(tint_lang_core_ir_transform lib
  tint_api_common
  tint_lang_core
  tint_lang_core_common
  tint_lang_core_constant
  tint_lang_core_intrinsic
  tint_lang_core_ir
  tint_lang_core_ir_transform_common
  tint_lang_core_type
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

tint_target_add_external_dependencies(tint_lang_core_ir_transform lib
  "src_utils"
)

################################################################################
# Target:    tint_lang_core_ir_transform_test
# Kind:      test
################################################################################
tint_add_target(tint_lang_core_ir_transform_test test
  lang/core/ir/transform/add_empty_entry_point_test.cc
  lang/core/ir/transform/array_length_from_uniform_test.cc
  lang/core/ir/transform/bgra8unorm_polyfill_test.cc
  lang/core/ir/transform/binary_polyfill_test.cc
  lang/core/ir/transform/binding_remapper_test.cc
  lang/core/ir/transform/block_decorated_structs_test.cc
  lang/core/ir/transform/builtin_polyfill_test.cc
  lang/core/ir/transform/combine_access_instructions_test.cc
  lang/core/ir/transform/conversion_polyfill_test.cc
  lang/core/ir/transform/demote_to_helper_test.cc
  lang/core/ir/transform/direct_variable_access_test.cc
  lang/core/ir/transform/helper_test.h
  lang/core/ir/transform/multiplanar_external_texture_test.cc
  lang/core/ir/transform/preserve_padding_test.cc
  lang/core/ir/transform/remove_continue_in_switch_test.cc
  lang/core/ir/transform/remove_terminator_args_test.cc
  lang/core/ir/transform/rename_conflicts_test.cc
  lang/core/ir/transform/robustness_test.cc
  lang/core/ir/transform/std140_test.cc
  lang/core/ir/transform/value_to_let_test.cc
  lang/core/ir/transform/vectorize_scalar_matrix_constructors_test.cc
  lang/core/ir/transform/zero_init_workgroup_memory_test.cc
)

tint_target_add_dependencies(tint_lang_core_ir_transform_test test
  tint_api_common
  tint_lang_core
  tint_lang_core_common
  tint_lang_core_constant
  tint_lang_core_intrinsic
  tint_lang_core_ir
  tint_lang_core_ir_transform
  tint_lang_core_type
  tint_lang_wgsl
  tint_lang_wgsl_ast
  tint_lang_wgsl_common
  tint_lang_wgsl_features
  tint_lang_wgsl_program
  tint_lang_wgsl_sem
  tint_lang_wgsl_writer_ir_to_program
  tint_lang_wgsl_writer_raise
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

tint_target_add_external_dependencies(tint_lang_core_ir_transform_test test
  "gtest"
  "src_utils"
)

if(TINT_BUILD_WGSL_READER)
  tint_target_add_dependencies(tint_lang_core_ir_transform_test test
    tint_lang_wgsl_reader
    tint_lang_wgsl_reader_program_to_ir
  )
endif(TINT_BUILD_WGSL_READER)

if(TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)
  tint_target_add_sources(tint_lang_core_ir_transform_test test
    "lang/core/ir/transform/direct_variable_access_wgsl_test.cc"
  )
endif(TINT_BUILD_WGSL_READER AND TINT_BUILD_WGSL_WRITER)

if(TINT_BUILD_WGSL_WRITER)
  tint_target_add_dependencies(tint_lang_core_ir_transform_test test
    tint_lang_wgsl_writer
  )
endif(TINT_BUILD_WGSL_WRITER)

################################################################################
# Target:    tint_lang_core_ir_transform_fuzz
# Kind:      fuzz
################################################################################
tint_add_target(tint_lang_core_ir_transform_fuzz fuzz
  lang/core/ir/transform/add_empty_entry_point_fuzz.cc
  lang/core/ir/transform/array_length_from_uniform_fuzz.cc
  lang/core/ir/transform/bgra8unorm_polyfill_fuzz.cc
  lang/core/ir/transform/binary_polyfill_fuzz.cc
  lang/core/ir/transform/binding_remapper_fuzz.cc
  lang/core/ir/transform/block_decorated_structs_fuzz.cc
  lang/core/ir/transform/builtin_polyfill_fuzz.cc
  lang/core/ir/transform/combine_access_instructions_fuzz.cc
  lang/core/ir/transform/conversion_polyfill_fuzz.cc
  lang/core/ir/transform/demote_to_helper_fuzz.cc
  lang/core/ir/transform/direct_variable_access_fuzz.cc
  lang/core/ir/transform/multiplanar_external_texture_fuzz.cc
  lang/core/ir/transform/preserve_padding_fuzz.cc
  lang/core/ir/transform/remove_terminator_args_fuzz.cc
  lang/core/ir/transform/rename_conflicts_fuzz.cc
  lang/core/ir/transform/robustness_fuzz.cc
  lang/core/ir/transform/std140_fuzz.cc
  lang/core/ir/transform/value_to_let_fuzz.cc
  lang/core/ir/transform/vectorize_scalar_matrix_constructors_fuzz.cc
  lang/core/ir/transform/zero_init_workgroup_memory_fuzz.cc
)

tint_target_add_dependencies(tint_lang_core_ir_transform_fuzz fuzz
  tint_api_common
  tint_cmd_fuzz_ir_fuzz
  tint_lang_core
  tint_lang_core_common
  tint_lang_core_constant
  tint_lang_core_ir
  tint_lang_core_ir_transform
  tint_lang_core_type
  tint_utils_bytes
  tint_utils_containers
  tint_utils_diagnostic
  tint_utils_ice
  tint_utils_id
  tint_utils_macros
  tint_utils_math
  tint_utils_memory
  tint_utils_reflection
  tint_utils_result
  tint_utils_rtti
  tint_utils_symbol
  tint_utils_text
  tint_utils_traits
)

tint_target_add_external_dependencies(tint_lang_core_ir_transform_fuzz fuzz
  "src_utils"
)
