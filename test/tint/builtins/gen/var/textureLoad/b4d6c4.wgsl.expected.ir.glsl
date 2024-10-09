#version 460
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  vec4 tint_symbol;
} v;
layout(binding = 0, rg32f) uniform highp image2D arg_0;
vec4 textureLoad_b4d6c4() {
  uvec2 arg_1 = uvec2(1u);
  vec4 res = imageLoad(arg_0, ivec2(arg_1));
  return res;
}
void main() {
  v.tint_symbol = textureLoad_b4d6c4();
}
#version 460

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  vec4 tint_symbol;
} v;
layout(binding = 0, rg32f) uniform highp image2D arg_0;
vec4 textureLoad_b4d6c4() {
  uvec2 arg_1 = uvec2(1u);
  vec4 res = imageLoad(arg_0, ivec2(arg_1));
  return res;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  v.tint_symbol = textureLoad_b4d6c4();
}
