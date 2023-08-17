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
# CMake target: 'tint_utils_text'
################################################################################
tint_add_target("utils/text"
  utils/text/string.cc
  utils/text/string.h
  utils/text/string_stream.cc
  utils/text/string_stream.h
  utils/text/unicode.cc
  utils/text/unicode.h
)

tint_target_add_dependencies("utils/text"
  "utils/containers"
  "utils/ice"
  "utils/macros"
  "utils/math"
  "utils/memory"
  "utils/rtti"
  "utils/traits"
)

################################################################################
# CMake target: 'tint_utils_text_test'
################################################################################
tint_add_target("utils/text:test"
  utils/text/string_stream_test.cc
  utils/text/string_test.cc
  utils/text/unicode_test.cc
)

tint_target_add_dependencies("utils/text:test"
  "utils/containers"
  "utils/ice"
  "utils/macros"
  "utils/math"
  "utils/memory"
  "utils/rtti"
  "utils/text"
  "utils/traits"
)

tint_target_add_external_dependencies("utils/text:test"
  "gtest"
)
