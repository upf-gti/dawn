#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  float inner;
} prevent_dce;

uniform highp samplerCubeShadow arg_0_arg_1;

float textureSample_ea7030() {
  float res = texture(arg_0_arg_1, vec4(vec3(1.0f), 0.0f));
  return res;
}

void fragment_main() {
  prevent_dce.inner = textureSample_ea7030();
}

void main() {
  fragment_main();
  return;
}
