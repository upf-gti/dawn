#version 310 es
precision highp float;
precision highp int;


vec3 prevent_dce;
vec3 dpdy_feb40f() {
  vec3 res = dFdy(vec3(1.0f));
  return res;
}
void main() {
  prevent_dce = dpdy_feb40f();
}
