#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, r32i) uniform highp iimage3D arg_0;
void textureStore_24e6b7() {
  ivec3 arg_1 = ivec3(1);
  ivec4 arg_2 = ivec4(1);
  imageStore(arg_0, arg_1, arg_2);
}
void main() {
  textureStore_24e6b7();
}
#version 310 es

layout(binding = 0, r32i) uniform highp iimage3D arg_0;
void textureStore_24e6b7() {
  ivec3 arg_1 = ivec3(1);
  ivec4 arg_2 = ivec4(1);
  imageStore(arg_0, arg_1, arg_2);
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  textureStore_24e6b7();
}
