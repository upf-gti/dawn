#version 310 es
precision highp float;
precision highp int;


vec3 prevent_dce;
vec3 dpdy_feb40f() {
  vec3 arg_0 = vec3(1.0f);
  vec3 res = dFdy(arg_0);
  return res;
}
void main() {
  prevent_dce = dpdy_feb40f();
}
