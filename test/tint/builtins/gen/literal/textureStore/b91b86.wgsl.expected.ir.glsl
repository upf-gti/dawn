#version 460
precision highp float;
precision highp int;

layout(binding = 0, r8) uniform highp writeonly image2DArray arg_0;
void textureStore_b91b86() {
  ivec2 v = ivec2(uvec2(1u));
  imageStore(arg_0, ivec3(v, int(1)), vec4(1.0f));
}
void main() {
  textureStore_b91b86();
}
#version 460

layout(binding = 0, r8) uniform highp writeonly image2DArray arg_0;
void textureStore_b91b86() {
  ivec2 v = ivec2(uvec2(1u));
  imageStore(arg_0, ivec3(v, int(1)), vec4(1.0f));
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  textureStore_b91b86();
}
