#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  vec2 tint_symbol;
} v;
vec2 dpdyFine_df33aa() {
  vec2 res = dFdy(vec2(1.0f));
  return res;
}
void main() {
  v.tint_symbol = dpdyFine_df33aa();
}
