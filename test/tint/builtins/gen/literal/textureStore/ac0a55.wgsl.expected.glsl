#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, rgba32ui) uniform highp writeonly uimage2DArray arg_0;
void textureStore_ac0a55() {
  imageStore(arg_0, ivec3(uvec3(uvec2(1u), 1u)), uvec4(1u));
}

void fragment_main() {
  textureStore_ac0a55();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

layout(binding = 0, rgba32ui) uniform highp writeonly uimage2DArray arg_0;
void textureStore_ac0a55() {
  imageStore(arg_0, ivec3(uvec3(uvec2(1u), 1u)), uvec4(1u));
}

void compute_main() {
  textureStore_ac0a55();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
