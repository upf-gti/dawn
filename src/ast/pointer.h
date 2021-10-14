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

#ifndef SRC_AST_POINTER_H_
#define SRC_AST_POINTER_H_

#include <string>

#include "src/ast/access.h"
#include "src/ast/storage_class.h"
#include "src/ast/type.h"

namespace tint {
namespace ast {

/// A pointer type.
class Pointer : public Castable<Pointer, Type> {
 public:
  /// Constructor
  /// @param program_id the identifier of the program that owns this node
  /// @param source the source of this node
  /// @param subtype the pointee type
  /// @param storage_class the storage class of the pointer
  /// @param access the access control of the pointer
  Pointer(ProgramID program_id,
          const Source& source,
          Type* const subtype,
          ast::StorageClass storage_class,
          ast::Access access);
  /// Move constructor
  Pointer(Pointer&&);
  ~Pointer() override;

  /// @returns the pointee type
  Type* type() const { return const_cast<Type*>(subtype_); }

  /// @returns the storage class of the pointer
  ast::StorageClass storage_class() const { return storage_class_; }

  /// @returns the access control of the pointer
  ast::Access access() const { return access_; }

  /// @param symbols the program's symbol table
  /// @returns the name for this type that closely resembles how it would be
  /// declared in WGSL.
  std::string FriendlyName(const SymbolTable& symbols) const override;

  /// Clones this type and all transitive types using the `CloneContext` `ctx`.
  /// @param ctx the clone context
  /// @return the newly cloned type
  Pointer* Clone(CloneContext* ctx) const override;

 private:
  Type const* const subtype_;
  ast::StorageClass const storage_class_;
  ast::Access const access_;
};

}  // namespace ast
}  // namespace tint

#endif  // SRC_AST_POINTER_H_
