#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, rgba32f) uniform highp writeonly image2DArray arg_0;
void textureStore_06e49c() {
  imageStore(arg_0, ivec3(ivec2(1), int(1u)), vec4(1.0f));
}
void main() {
  textureStore_06e49c();
}
#version 310 es

layout(binding = 0, rgba32f) uniform highp writeonly image2DArray arg_0;
void textureStore_06e49c() {
  imageStore(arg_0, ivec3(ivec2(1), int(1u)), vec4(1.0f));
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  textureStore_06e49c();
}
