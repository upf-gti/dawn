#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  vec4 tint_symbol;
} v;
uniform highp samplerCube arg_0_arg_1;
vec4 textureSampleBias_53b9f7() {
  vec4 res = texture(arg_0_arg_1, vec3(1.0f), 1.0f);
  return res;
}
void main() {
  v.tint_symbol = textureSampleBias_53b9f7();
}
