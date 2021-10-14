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

#include "src/ast/call_statement.h"
#include "src/ast/stage_decoration.h"
#include "src/ast/struct_block_decoration.h"
#include "src/ast/variable_decl_statement.h"
#include "src/writer/glsl/test_helper.h"

namespace tint {
namespace writer {
namespace glsl {
namespace {

using GlslSanitizerTest = TestHelper;

TEST_F(GlslSanitizerTest, Call_ArrayLength) {
  auto* s = Structure("my_struct", {Member(0, "a", ty.array<f32>(4))},
                      {create<ast::StructBlockDecoration>()});
  Global("b", ty.Of(s), ast::StorageClass::kStorage, ast::Access::kRead,
         ast::DecorationList{
             create<ast::BindingDecoration>(1),
             create<ast::GroupDecoration>(2),
         });

  Func("a_func", ast::VariableList{}, ty.void_(),
       ast::StatementList{
           Decl(Var("len", ty.u32(), ast::StorageClass::kNone,
                    Call("arrayLength", AddressOf(MemberAccessor("b", "a"))))),
       },
       ast::DecorationList{
           Stage(ast::PipelineStage::kFragment),
       });

  GeneratorImpl& gen = SanitizeAndBuild();

  ASSERT_TRUE(gen.Generate()) << gen.error();

  auto got = gen.result();
  auto* expect = R"(#version 310 es
precision mediump float;


my_struct b;

void a_func() {
  uint tint_symbol_1 = 0u;
  b.GetDimensions(tint_symbol_1);
  uint tint_symbol_2 = ((tint_symbol_1 - 0u) / 4u);
  uint len = tint_symbol_2;
  return;
}
void main() {
  a_func();
}


)";
  EXPECT_EQ(expect, got);
}

TEST_F(GlslSanitizerTest, Call_ArrayLength_OtherMembersInStruct) {
  auto* s = Structure("my_struct",
                      {
                          Member(0, "z", ty.f32()),
                          Member(4, "a", ty.array<f32>(4)),
                      },
                      {create<ast::StructBlockDecoration>()});
  Global("b", ty.Of(s), ast::StorageClass::kStorage, ast::Access::kRead,
         ast::DecorationList{
             create<ast::BindingDecoration>(1),
             create<ast::GroupDecoration>(2),
         });

  Func("a_func", ast::VariableList{}, ty.void_(),
       ast::StatementList{
           Decl(Var("len", ty.u32(), ast::StorageClass::kNone,
                    Call("arrayLength", AddressOf(MemberAccessor("b", "a"))))),
       },
       ast::DecorationList{
           Stage(ast::PipelineStage::kFragment),
       });

  GeneratorImpl& gen = SanitizeAndBuild();

  ASSERT_TRUE(gen.Generate()) << gen.error();

  auto got = gen.result();
  auto* expect = R"(#version 310 es
precision mediump float;


my_struct b;

void a_func() {
  uint tint_symbol_1 = 0u;
  b.GetDimensions(tint_symbol_1);
  uint tint_symbol_2 = ((tint_symbol_1 - 4u) / 4u);
  uint len = tint_symbol_2;
  return;
}
void main() {
  a_func();
}


)";

  EXPECT_EQ(expect, got);
}

TEST_F(GlslSanitizerTest, Call_ArrayLength_ViaLets) {
  auto* s = Structure("my_struct", {Member(0, "a", ty.array<f32>(4))},
                      {create<ast::StructBlockDecoration>()});
  Global("b", ty.Of(s), ast::StorageClass::kStorage, ast::Access::kRead,
         ast::DecorationList{
             create<ast::BindingDecoration>(1),
             create<ast::GroupDecoration>(2),
         });

  auto* p = Const("p", nullptr, AddressOf("b"));
  auto* p2 = Const("p2", nullptr, AddressOf(MemberAccessor(Deref(p), "a")));

  Func("a_func", ast::VariableList{}, ty.void_(),
       ast::StatementList{
           Decl(p),
           Decl(p2),
           Decl(Var("len", ty.u32(), ast::StorageClass::kNone,
                    Call("arrayLength", p2))),
       },
       ast::DecorationList{
           Stage(ast::PipelineStage::kFragment),
       });

  GeneratorImpl& gen = SanitizeAndBuild();

  ASSERT_TRUE(gen.Generate()) << gen.error();

  auto got = gen.result();
  auto* expect = R"(#version 310 es
precision mediump float;


my_struct b;

void a_func() {
  uint tint_symbol_1 = 0u;
  b.GetDimensions(tint_symbol_1);
  uint tint_symbol_2 = ((tint_symbol_1 - 0u) / 4u);
  uint len = tint_symbol_2;
  return;
}
void main() {
  a_func();
}


)";

  EXPECT_EQ(expect, got);
}

TEST_F(GlslSanitizerTest, PromoteArrayInitializerToConstVar) {
  auto* array_init = array<i32, 4>(1, 2, 3, 4);
  auto* array_index = IndexAccessor(array_init, 3);
  auto* pos = Var("pos", ty.i32(), ast::StorageClass::kNone, array_index);

  Func("main", ast::VariableList{}, ty.void_(),
       {
           Decl(pos),
       },
       {
           Stage(ast::PipelineStage::kFragment),
       });

  GeneratorImpl& gen = SanitizeAndBuild();

  ASSERT_TRUE(gen.Generate()) << gen.error();

  auto got = gen.result();
  auto* expect = R"(#version 310 es
precision mediump float;

void tint_symbol() {
  int tint_symbol_1[4] = int[4](1, 2, 3, 4);
  int pos = tint_symbol_1[3];
  return;
}
void main() {
  tint_symbol();
}


)";
  EXPECT_EQ(expect, got);
}

TEST_F(GlslSanitizerTest, PromoteStructInitializerToConstVar) {
  auto* str = Structure("S", {
                                 Member("a", ty.i32()),
                                 Member("b", ty.vec3<f32>()),
                                 Member("c", ty.i32()),
                             });
  auto* struct_init = Construct(ty.Of(str), 1, vec3<f32>(2.f, 3.f, 4.f), 4);
  auto* struct_access = MemberAccessor(struct_init, "b");
  auto* pos =
      Var("pos", ty.vec3<f32>(), ast::StorageClass::kNone, struct_access);

  Func("main", ast::VariableList{}, ty.void_(),
       {
           Decl(pos),
       },
       {
           Stage(ast::PipelineStage::kFragment),
       });

  GeneratorImpl& gen = SanitizeAndBuild();

  ASSERT_TRUE(gen.Generate()) << gen.error();

  auto got = gen.result();
  auto* expect = R"(#version 310 es
precision mediump float;

struct S {
  int a;
  vec3 b;
  int c;
};

void tint_symbol() {
  S tint_symbol_1 = S(1, vec3(2.0f, 3.0f, 4.0f), 4);
  vec3 pos = tint_symbol_1.b;
  return;
}
void main() {
  tint_symbol();
}


)";
  EXPECT_EQ(expect, got);
}

TEST_F(GlslSanitizerTest, InlinePtrLetsBasic) {
  // var v : i32;
  // let p : ptr<function, i32> = &v;
  // let x : i32 = *p;
  auto* v = Var("v", ty.i32());
  auto* p =
      Const("p", ty.pointer<i32>(ast::StorageClass::kFunction), AddressOf(v));
  auto* x = Var("x", ty.i32(), ast::StorageClass::kNone, Deref(p));

  Func("main", ast::VariableList{}, ty.void_(),
       {
           Decl(v),
           Decl(p),
           Decl(x),
       },
       {
           Stage(ast::PipelineStage::kFragment),
       });

  GeneratorImpl& gen = SanitizeAndBuild();

  ASSERT_TRUE(gen.Generate()) << gen.error();

  auto got = gen.result();
  auto* expect = R"(#version 310 es
precision mediump float;

void tint_symbol() {
  int v = 0;
  int x = v;
  return;
}
void main() {
  tint_symbol();
}


)";
  EXPECT_EQ(expect, got);
}

TEST_F(GlslSanitizerTest, InlinePtrLetsComplexChain) {
  // var m : mat4x4<f32>;
  // let mp : ptr<function, mat4x4<f32>> = &m;
  // let vp : ptr<function, vec4<f32>> = &(*mp)[2];
  // let fp : ptr<function, f32> = &(*vp)[1];
  // let f : f32 = *fp;
  auto* m = Var("m", ty.mat4x4<f32>());
  auto* mp =
      Const("mp", ty.pointer(ty.mat4x4<f32>(), ast::StorageClass::kFunction),
            AddressOf(m));
  auto* vp =
      Const("vp", ty.pointer(ty.vec4<f32>(), ast::StorageClass::kFunction),
            AddressOf(IndexAccessor(Deref(mp), 2)));
  auto* fp = Const("fp", ty.pointer<f32>(ast::StorageClass::kFunction),
                   AddressOf(IndexAccessor(Deref(vp), 1)));
  auto* f = Var("f", ty.f32(), ast::StorageClass::kNone, Deref(fp));

  Func("main", ast::VariableList{}, ty.void_(),
       {
           Decl(m),
           Decl(mp),
           Decl(vp),
           Decl(fp),
           Decl(f),
       },
       {
           Stage(ast::PipelineStage::kFragment),
       });

  GeneratorImpl& gen = SanitizeAndBuild();

  ASSERT_TRUE(gen.Generate()) << gen.error();

  auto got = gen.result();
  auto* expect = R"(#version 310 es
precision mediump float;

void tint_symbol() {
  mat4 m = mat4(0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f);
  float f = m[2][1];
  return;
}
void main() {
  tint_symbol();
}


)";
  EXPECT_EQ(expect, got);
}

}  // namespace
}  // namespace glsl
}  // namespace writer
}  // namespace tint
