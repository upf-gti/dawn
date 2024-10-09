#version 460

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  float inner;
} prevent_dce;

uniform highp samplerCubeArrayShadow arg_0_arg_1;

float textureSampleCompare_1912e5() {
  float res = texture(arg_0_arg_1, vec4(vec3(1.0f), float(1u)), 1.0f);
  return res;
}

void fragment_main() {
  prevent_dce.inner = textureSampleCompare_1912e5();
}

void main() {
  fragment_main();
  return;
}
