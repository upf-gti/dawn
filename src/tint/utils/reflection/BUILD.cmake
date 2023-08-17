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

tint_add_target("utils/reflection"
  utils/reflection/reflection.cc
  utils/reflection/reflection.h
)

tint_target_add_dependencies("utils/reflection"
  "utils/macros"
)

tint_add_target("utils/reflection:test"
  utils/reflection/reflection_test.cc
)

tint_target_add_dependencies("utils/reflection:test"
  "utils/macros"
  "utils/reflection"
)

tint_target_add_external_dependencies("utils/reflection:test"
  "gtest"
)
