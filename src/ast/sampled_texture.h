// Copyright 2020 The Tint Authors.
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

#ifndef SRC_AST_SAMPLED_TEXTURE_H_
#define SRC_AST_SAMPLED_TEXTURE_H_

#include <string>

#include "src/ast/texture.h"

namespace tint {
namespace ast {

/// A sampled texture type.
class SampledTexture : public Castable<SampledTexture, Texture> {
 public:
  /// Constructor
  /// @param program_id the identifier of the program that owns this node
  /// @param source the source of this node
  /// @param dim the dimensionality of the texture
  /// @param type the data type of the sampled texture
  SampledTexture(ProgramID program_id,
                 const Source& source,
                 TextureDimension dim,
                 Type const* type);
  /// Move constructor
  SampledTexture(SampledTexture&&);
  ~SampledTexture() override;

  /// @returns the subtype of the sampled texture
  Type* type() const { return const_cast<Type*>(type_); }

  /// @param symbols the program's symbol table
  /// @returns the name for this type that closely resembles how it would be
  /// declared in WGSL.
  std::string FriendlyName(const SymbolTable& symbols) const override;

  /// Clones this type and all transitive types using the `CloneContext` `ctx`.
  /// @param ctx the clone context
  /// @return the newly cloned type
  SampledTexture* Clone(CloneContext* ctx) const override;

 private:
  Type const* const type_;
};

}  // namespace ast
}  // namespace tint

#endif  // SRC_AST_SAMPLED_TEXTURE_H_
