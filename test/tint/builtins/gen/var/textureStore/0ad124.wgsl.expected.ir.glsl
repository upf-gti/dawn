#version 460
precision highp float;
precision highp int;

layout(binding = 0, r8) uniform highp image1D arg_0;
void textureStore_0ad124() {
  int arg_1 = 1;
  vec4 arg_2 = vec4(1.0f);
  imageStore(arg_0, arg_1, arg_2);
}
void main() {
  textureStore_0ad124();
}
#version 460

layout(binding = 0, r8) uniform highp image1D arg_0;
void textureStore_0ad124() {
  int arg_1 = 1;
  vec4 arg_2 = vec4(1.0f);
  imageStore(arg_0, arg_1, arg_2);
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  textureStore_0ad124();
}
