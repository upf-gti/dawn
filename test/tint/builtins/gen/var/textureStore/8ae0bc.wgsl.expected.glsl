#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, rgba8_snorm) uniform highp writeonly image2DArray arg_0;
void textureStore_8ae0bc() {
  ivec2 arg_1 = ivec2(1);
  uint arg_2 = 1u;
  vec4 arg_3 = vec4(1.0f);
  imageStore(arg_0, ivec3(arg_1, int(arg_2)), arg_3);
}

void fragment_main() {
  textureStore_8ae0bc();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

layout(binding = 0, rgba8_snorm) uniform highp writeonly image2DArray arg_0;
void textureStore_8ae0bc() {
  ivec2 arg_1 = ivec2(1);
  uint arg_2 = 1u;
  vec4 arg_3 = vec4(1.0f);
  imageStore(arg_0, ivec3(arg_1, int(arg_2)), arg_3);
}

void compute_main() {
  textureStore_8ae0bc();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
