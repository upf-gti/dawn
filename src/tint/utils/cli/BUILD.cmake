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

tint_add_target("utils/cli"
  utils/cli/cli.cc
  utils/cli/cli.h
)

tint_target_add_dependencies("utils/cli"
  "utils/containers"
  "utils/ice"
  "utils/macros"
  "utils/math"
  "utils/memory"
  "utils/result"
  "utils/rtti"
  "utils/strconv"
  "utils/text"
  "utils/traits"
)

tint_add_target("utils/cli:test"
  utils/cli/cli_test.cc
)

tint_target_add_dependencies("utils/cli:test"
  "utils/cli"
  "utils/containers"
  "utils/ice"
  "utils/macros"
  "utils/math"
  "utils/memory"
  "utils/result"
  "utils/rtti"
  "utils/strconv"
  "utils/text"
  "utils/traits"
)

tint_target_add_external_dependencies("utils/cli:test"
  "gtest"
)
