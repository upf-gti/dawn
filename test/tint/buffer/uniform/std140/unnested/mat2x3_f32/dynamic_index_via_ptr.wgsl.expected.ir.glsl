#version 310 es

layout(binding = 0, std140)
uniform tint_symbol_1_std140_1_ubo {
  vec3 tint_symbol_col0;
  uint tint_pad;
  vec3 tint_symbol_col1;
} v;
int counter = 0;
int i() {
  counter = (counter + 1);
  return counter;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  mat2x3 v_1 = mat2x3(v.tint_symbol_col0, v.tint_symbol_col1);
  mat2x3 l_m = v_1;
  vec3 l_m_i = v_1[i()];
}
