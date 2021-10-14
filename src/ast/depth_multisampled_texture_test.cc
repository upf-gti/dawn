// Copyright 2021 The Tint Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "src/ast/depth_multisampled_texture.h"

#include "src/ast/test_helper.h"

namespace tint {
namespace ast {
namespace {

using AstDepthMultisampledTextureTest = TestHelper;

TEST_F(AstDepthMultisampledTextureTest, Dim) {
  auto* d = create<DepthMultisampledTexture>(TextureDimension::k2d);
  EXPECT_EQ(d->dim(), TextureDimension::k2d);
}

TEST_F(AstDepthMultisampledTextureTest, FriendlyName) {
  auto* d = create<DepthMultisampledTexture>(TextureDimension::k2d);
  EXPECT_EQ(d->FriendlyName(Symbols()), "texture_depth_multisampled_2d");
}

}  // namespace
}  // namespace ast
}  // namespace tint
