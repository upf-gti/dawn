#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  vec4 tint_symbol;
} v;
vec4 dpdxFine_8c5069() {
  vec4 arg_0 = vec4(1.0f);
  vec4 res = dFdx(arg_0);
  return res;
}
void main() {
  v.tint_symbol = dpdxFine_8c5069();
}
