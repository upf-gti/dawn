#version 310 es
precision highp float;
precision highp int;


vec2 prevent_dce;
vec2 dpdx_99edb1() {
  vec2 arg_0 = vec2(1.0f);
  vec2 res = dFdx(arg_0);
  return res;
}
void main() {
  prevent_dce = dpdx_99edb1();
}
