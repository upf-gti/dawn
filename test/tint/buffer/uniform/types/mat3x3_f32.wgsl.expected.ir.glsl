#version 310 es

layout(binding = 0, std140)
uniform tint_symbol_2_std140_1_ubo {
  vec3 tint_symbol_1_col0;
  uint tint_pad;
  vec3 tint_symbol_1_col1;
  uint tint_pad_1;
  vec3 tint_symbol_1_col2;
} v;
layout(binding = 1, std430)
buffer tint_symbol_4_1_ssbo {
  mat3 tint_symbol_3;
} v_1;
void tint_store_and_preserve_padding(inout mat3 target, mat3 value_param) {
  target[0u] = value_param[0u];
  target[1u] = value_param[1u];
  target[2u] = value_param[2u];
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  mat3 x = mat3(v.tint_symbol_1_col0, v.tint_symbol_1_col1, v.tint_symbol_1_col2);
  tint_store_and_preserve_padding(v_1.tint_symbol_3, x);
}
