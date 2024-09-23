#version 310 es


struct S {
  ivec4 a;
};

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  S tint_symbol;
} v_1;
ivec4 tint_div_v4i32(ivec4 lhs, ivec4 rhs) {
  uvec4 v_2 = uvec4((lhs == ivec4((-2147483647 - 1))));
  bvec4 v_3 = bvec4((v_2 & uvec4((rhs == ivec4(-1)))));
  uvec4 v_4 = uvec4((rhs == ivec4(0)));
  bvec4 v_5 = bvec4((v_4 | uvec4(v_3)));
  int v_6 = ((v_5.x) ? (ivec4(1).x) : (rhs.x));
  int v_7 = ((v_5.y) ? (ivec4(1).y) : (rhs.y));
  int v_8 = ((v_5.z) ? (ivec4(1).z) : (rhs.z));
  return (lhs / ivec4(v_6, v_7, v_8, ((v_5.w) ? (ivec4(1).w) : (rhs.w))));
}
void foo() {
  v_1.tint_symbol.a = tint_div_v4i32(v_1.tint_symbol.a, ivec4(2));
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
