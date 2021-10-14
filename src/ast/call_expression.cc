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

#include "src/ast/call_expression.h"

#include "src/program_builder.h"

TINT_INSTANTIATE_TYPEINFO(tint::ast::CallExpression);

namespace tint {
namespace ast {

CallExpression::CallExpression(ProgramID program_id,
                               const Source& source,
                               IdentifierExpression* func,
                               ExpressionList args)
    : Base(program_id, source), func_(func), args_(args) {
  TINT_ASSERT(AST, func_);
  TINT_ASSERT_PROGRAM_IDS_EQUAL_IF_VALID(AST, func_, program_id);
  for (auto* arg : args_) {
    TINT_ASSERT(AST, arg);
    TINT_ASSERT_PROGRAM_IDS_EQUAL_IF_VALID(AST, arg, program_id);
  }
}

CallExpression::CallExpression(CallExpression&&) = default;

CallExpression::~CallExpression() = default;

CallExpression* CallExpression::Clone(CloneContext* ctx) const {
  // Clone arguments outside of create() call to have deterministic ordering
  auto src = ctx->Clone(source());
  auto* fn = ctx->Clone(func_);
  auto p = ctx->Clone(args_);
  return ctx->dst->create<CallExpression>(src, fn, p);
}

}  // namespace ast
}  // namespace tint
