#version 460
precision highp float;
precision highp int;

layout(binding = 0, rg32f) uniform highp image1D arg_0;
void textureStore_51ec82() {
  imageStore(arg_0, 1, vec4(1.0f));
}
void main() {
  textureStore_51ec82();
}
#version 460

layout(binding = 0, rg32f) uniform highp image1D arg_0;
void textureStore_51ec82() {
  imageStore(arg_0, 1, vec4(1.0f));
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  textureStore_51ec82();
}
