#version 310 es
#extension GL_AMD_gpu_shader_half_float: require

float t = 0.0f;
mat2x4 m() {
  t = (t + 1.0f);
  return mat2x4(vec4(1.0f, 2.0f, 3.0f, 4.0f), vec4(5.0f, 6.0f, 7.0f, 8.0f));
}
void f() {
  f16mat2x4 v = f16mat2x4(m());
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
