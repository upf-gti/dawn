#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, rgba16i) uniform highp writeonly iimage2DArray arg_0;
void textureStore_7dd042() {
  imageStore(arg_0, ivec3(ivec2(1), 1), ivec4(1));
}

void fragment_main() {
  textureStore_7dd042();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

layout(binding = 0, rgba16i) uniform highp writeonly iimage2DArray arg_0;
void textureStore_7dd042() {
  imageStore(arg_0, ivec3(ivec2(1), 1), ivec4(1));
}

void compute_main() {
  textureStore_7dd042();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
