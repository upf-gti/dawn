#version 310 es

layout(binding = 0, std140)
uniform tint_symbol_1_std140_1_ubo {
  vec3 tint_symbol_col0;
  uint tint_pad;
  vec3 tint_symbol_col1;
  uint tint_pad_1;
  vec3 tint_symbol_col2;
  uint tint_pad_2;
  vec3 tint_symbol_col3;
} v_1;
void a(mat4x3 m) {
}
void b(vec3 v) {
}
void c(float f) {
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  a(mat4x3(v_1.tint_symbol_col0, v_1.tint_symbol_col1, v_1.tint_symbol_col2, v_1.tint_symbol_col3));
  b(mat4x3(v_1.tint_symbol_col0, v_1.tint_symbol_col1, v_1.tint_symbol_col2, v_1.tint_symbol_col3)[1]);
  b(mat4x3(v_1.tint_symbol_col0, v_1.tint_symbol_col1, v_1.tint_symbol_col2, v_1.tint_symbol_col3)[1].zxy);
  c(mat4x3(v_1.tint_symbol_col0, v_1.tint_symbol_col1, v_1.tint_symbol_col2, v_1.tint_symbol_col3)[1][0u]);
  c(mat4x3(v_1.tint_symbol_col0, v_1.tint_symbol_col1, v_1.tint_symbol_col2, v_1.tint_symbol_col3)[1].zxy[0u]);
}
