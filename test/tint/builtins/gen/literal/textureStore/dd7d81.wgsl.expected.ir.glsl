#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, rgba8_snorm) uniform highp writeonly image3D arg_0;
void textureStore_dd7d81() {
  imageStore(arg_0, ivec3(1), vec4(1.0f));
}
void main() {
  textureStore_dd7d81();
}
#version 310 es

layout(binding = 0, rgba8_snorm) uniform highp writeonly image3D arg_0;
void textureStore_dd7d81() {
  imageStore(arg_0, ivec3(1), vec4(1.0f));
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  textureStore_dd7d81();
}
