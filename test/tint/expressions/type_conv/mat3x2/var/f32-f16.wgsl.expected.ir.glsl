#version 310 es
#extension GL_AMD_gpu_shader_half_float: require

mat3x2 u = mat3x2(vec2(1.0f, 2.0f), vec2(3.0f, 4.0f), vec2(5.0f, 6.0f));
void f() {
  f16mat3x2 v = f16mat3x2(u);
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
