#version 310 es
precision highp float;
precision highp int;

uint tint_first_leading_bit(uint v) {
  uint x = v;
  uint b16 = (bool((x & 4294901760u)) ? 16u : 0u);
  x = (x >> b16);
  uint b8 = (bool((x & 65280u)) ? 8u : 0u);
  x = (x >> b8);
  uint b4 = (bool((x & 240u)) ? 4u : 0u);
  x = (x >> b4);
  uint b2 = (bool((x & 12u)) ? 2u : 0u);
  x = (x >> b2);
  uint b1 = (bool((x & 2u)) ? 1u : 0u);
  uint is_zero = ((x == 0u) ? 4294967295u : 0u);
  return uint((((((b16 | b8) | b4) | b2) | b1) | is_zero));
}

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  uint inner;
} prevent_dce;

uint firstLeadingBit_f0779d() {
  uint arg_0 = 1u;
  uint res = tint_first_leading_bit(arg_0);
  return res;
}

struct VertexOutput {
  vec4 pos;
  uint prevent_dce;
};

void fragment_main() {
  prevent_dce.inner = firstLeadingBit_f0779d();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

uint tint_first_leading_bit(uint v) {
  uint x = v;
  uint b16 = (bool((x & 4294901760u)) ? 16u : 0u);
  x = (x >> b16);
  uint b8 = (bool((x & 65280u)) ? 8u : 0u);
  x = (x >> b8);
  uint b4 = (bool((x & 240u)) ? 4u : 0u);
  x = (x >> b4);
  uint b2 = (bool((x & 12u)) ? 2u : 0u);
  x = (x >> b2);
  uint b1 = (bool((x & 2u)) ? 1u : 0u);
  uint is_zero = ((x == 0u) ? 4294967295u : 0u);
  return uint((((((b16 | b8) | b4) | b2) | b1) | is_zero));
}

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  uint inner;
} prevent_dce;

uint firstLeadingBit_f0779d() {
  uint arg_0 = 1u;
  uint res = tint_first_leading_bit(arg_0);
  return res;
}

struct VertexOutput {
  vec4 pos;
  uint prevent_dce;
};

void compute_main() {
  prevent_dce.inner = firstLeadingBit_f0779d();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
#version 310 es

uint tint_first_leading_bit(uint v) {
  uint x = v;
  uint b16 = (bool((x & 4294901760u)) ? 16u : 0u);
  x = (x >> b16);
  uint b8 = (bool((x & 65280u)) ? 8u : 0u);
  x = (x >> b8);
  uint b4 = (bool((x & 240u)) ? 4u : 0u);
  x = (x >> b4);
  uint b2 = (bool((x & 12u)) ? 2u : 0u);
  x = (x >> b2);
  uint b1 = (bool((x & 2u)) ? 1u : 0u);
  uint is_zero = ((x == 0u) ? 4294967295u : 0u);
  return uint((((((b16 | b8) | b4) | b2) | b1) | is_zero));
}

layout(location = 0) flat out uint prevent_dce_1;
uint firstLeadingBit_f0779d() {
  uint arg_0 = 1u;
  uint res = tint_first_leading_bit(arg_0);
  return res;
}

struct VertexOutput {
  vec4 pos;
  uint prevent_dce;
};

VertexOutput vertex_main() {
  VertexOutput tint_symbol = VertexOutput(vec4(0.0f, 0.0f, 0.0f, 0.0f), 0u);
  tint_symbol.pos = vec4(0.0f);
  tint_symbol.prevent_dce = firstLeadingBit_f0779d();
  return tint_symbol;
}

void main() {
  gl_PointSize = 1.0;
  VertexOutput inner_result = vertex_main();
  gl_Position = inner_result.pos;
  prevent_dce_1 = inner_result.prevent_dce;
  gl_Position.y = -(gl_Position.y);
  gl_Position.z = ((2.0f * gl_Position.z) - gl_Position.w);
  return;
}
