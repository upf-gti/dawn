#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  vec4 tint_symbol;
} v;
uniform highp sampler2D arg_0_arg_1;
vec4 textureSample_85c4ba() {
  vec2 arg_2 = vec2(1.0f);
  vec4 res = textureOffset(arg_0_arg_1, arg_2, ivec2(1));
  return res;
}
void main() {
  v.tint_symbol = textureSample_85c4ba();
}
