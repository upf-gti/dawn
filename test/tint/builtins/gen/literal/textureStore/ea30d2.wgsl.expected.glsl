#version 460

layout(binding = 0, rg32i) uniform highp iimage2DArray arg_0;
void textureStore_ea30d2() {
  imageStore(arg_0, ivec3(uvec3(uvec2(1u), uint(1))), ivec4(1));
}

void fragment_main() {
  textureStore_ea30d2();
}

void main() {
  fragment_main();
  return;
}
#version 460

layout(binding = 0, rg32i) uniform highp iimage2DArray arg_0;
void textureStore_ea30d2() {
  imageStore(arg_0, ivec3(uvec3(uvec2(1u), uint(1))), ivec4(1));
}

void compute_main() {
  textureStore_ea30d2();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
