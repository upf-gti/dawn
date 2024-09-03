#version 310 es
#extension GL_AMD_gpu_shader_half_float: require

uniform f16mat4x3 u;
f16mat4x3 s;
void tint_store_and_preserve_padding(inout f16mat4x3 target, f16mat4x3 value_param) {
  target[0u] = value_param[0u];
  target[1u] = value_param[1u];
  target[2u] = value_param[2u];
  target[3u] = value_param[3u];
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  f16mat4x3 x = u;
  tint_store_and_preserve_padding(s, x);
}
