#version 460

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  ivec4 inner;
} prevent_dce;

layout(binding = 0, rg32i) uniform highp iimage2D arg_0;
ivec4 textureLoad_aa6130() {
  ivec2 arg_1 = ivec2(1);
  ivec4 res = imageLoad(arg_0, arg_1);
  return res;
}

void fragment_main() {
  prevent_dce.inner = textureLoad_aa6130();
}

void main() {
  fragment_main();
  return;
}
#version 460

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  ivec4 inner;
} prevent_dce;

layout(binding = 0, rg32i) uniform highp iimage2D arg_0;
ivec4 textureLoad_aa6130() {
  ivec2 arg_1 = ivec2(1);
  ivec4 res = imageLoad(arg_0, arg_1);
  return res;
}

void compute_main() {
  prevent_dce.inner = textureLoad_aa6130();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
