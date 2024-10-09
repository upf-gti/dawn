#version 460

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  vec4 inner;
} prevent_dce;

layout(binding = 0, r8) uniform highp image2DArray arg_0;
vec4 textureLoad_72c9c3() {
  ivec2 arg_1 = ivec2(1);
  uint arg_2 = 1u;
  vec4 res = imageLoad(arg_0, ivec3(arg_1, int(arg_2)));
  return res;
}

void fragment_main() {
  prevent_dce.inner = textureLoad_72c9c3();
}

void main() {
  fragment_main();
  return;
}
#version 460

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  vec4 inner;
} prevent_dce;

layout(binding = 0, r8) uniform highp image2DArray arg_0;
vec4 textureLoad_72c9c3() {
  ivec2 arg_1 = ivec2(1);
  uint arg_2 = 1u;
  vec4 res = imageLoad(arg_0, ivec3(arg_1, int(arg_2)));
  return res;
}

void compute_main() {
  prevent_dce.inner = textureLoad_72c9c3();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
