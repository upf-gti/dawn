#version 310 es
#extension GL_AMD_gpu_shader_half_float: require

layout(binding = 0, std140)
uniform tint_symbol_1_std140_1_ubo {
  f16vec3 tint_symbol_col0;
  f16vec3 tint_symbol_col1;
  f16vec3 tint_symbol_col2;
} v;
int counter = 0;
int i() {
  counter = (counter + 1);
  return counter;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  f16mat3 v_1 = f16mat3(v.tint_symbol_col0, v.tint_symbol_col1, v.tint_symbol_col2);
  f16mat3 l_m = v_1;
  f16vec3 l_m_i = v_1[i()];
}
