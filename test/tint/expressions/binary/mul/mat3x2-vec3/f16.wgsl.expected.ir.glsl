#version 310 es
#extension GL_AMD_gpu_shader_half_float: require
precision highp float;
precision highp int;


struct S_std140 {
  f16vec2 matrix_col0;
  f16vec2 matrix_col1;
  f16vec2 matrix_col2;
  uint tint_pad;
  f16vec3 vector;
};

layout(binding = 0, std140)
uniform tint_symbol_2_std140_1_ubo {
  S_std140 tint_symbol_1;
} v;
void main() {
  f16mat3x2 v_1 = f16mat3x2(v.tint_symbol_1.matrix_col0, v.tint_symbol_1.matrix_col1, v.tint_symbol_1.matrix_col2);
  f16vec2 x = (v_1 * v.tint_symbol_1.vector);
}
