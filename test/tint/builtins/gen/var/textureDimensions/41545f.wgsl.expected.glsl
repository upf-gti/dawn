#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  uvec2 inner;
} prevent_dce;

layout(binding = 0, r32ui) uniform highp writeonly uimage2DArray arg_0;
uvec2 textureDimensions_41545f() {
  uvec2 res = uvec2(imageSize(arg_0).xy);
  return res;
}

void fragment_main() {
  prevent_dce.inner = textureDimensions_41545f();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  uvec2 inner;
} prevent_dce;

layout(binding = 0, r32ui) uniform highp writeonly uimage2DArray arg_0;
uvec2 textureDimensions_41545f() {
  uvec2 res = uvec2(imageSize(arg_0).xy);
  return res;
}

void compute_main() {
  prevent_dce.inner = textureDimensions_41545f();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
