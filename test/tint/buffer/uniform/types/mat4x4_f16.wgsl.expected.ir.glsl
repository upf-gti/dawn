#version 310 es
#extension GL_AMD_gpu_shader_half_float: require

uniform f16mat4 u;
f16mat4 s;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  f16mat4 x = u;
  s = x;
}
