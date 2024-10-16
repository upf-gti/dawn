#version 310 es
precision highp float;
precision highp int;


struct S_std140 {
  vec3 matrix_col0;
  uint tint_pad;
  vec3 matrix_col1;
  uint tint_pad_1;
  vec3 matrix_col2;
  uint tint_pad_2;
  vec3 matrix_col3;
  uint tint_pad_3;
  vec3 vector;
  uint tint_pad_4;
};

layout(binding = 0, std140)
uniform tint_symbol_2_std140_1_ubo {
  S_std140 tint_symbol_1;
} v;
void main() {
  vec3 v_1 = v.tint_symbol_1.vector;
  vec4 x = (v_1 * mat4x3(v.tint_symbol_1.matrix_col0, v.tint_symbol_1.matrix_col1, v.tint_symbol_1.matrix_col2, v.tint_symbol_1.matrix_col3));
}
