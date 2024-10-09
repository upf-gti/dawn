#version 310 es
#extension GL_AMD_gpu_shader_half_float: require

layout(binding = 0, std140)
uniform tint_symbol_1_std140_1_ubo {
  f16vec3 tint_symbol_col0;
  f16vec3 tint_symbol_col1;
} v;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  f16mat2x3 v_1 = f16mat2x3(v.tint_symbol_col0, v.tint_symbol_col1);
  f16mat2x3 l_m = v_1;
  f16vec3 l_m_1 = v_1[1];
}
