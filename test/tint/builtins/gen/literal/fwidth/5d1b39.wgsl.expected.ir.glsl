#version 310 es
precision highp float;
precision highp int;


vec3 prevent_dce;
vec3 fwidth_5d1b39() {
  vec3 res = fwidth(vec3(1.0f));
  return res;
}
void main() {
  prevent_dce = fwidth_5d1b39();
}
