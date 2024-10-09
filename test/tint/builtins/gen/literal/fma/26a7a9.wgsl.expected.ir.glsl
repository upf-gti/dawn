#version 310 es
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  vec2 tint_symbol;
} v;
vec2 fma_26a7a9() {
  vec2 res = vec2(2.0f);
  return res;
}
void main() {
  v.tint_symbol = fma_26a7a9();
}
#version 310 es

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  vec2 tint_symbol;
} v;
vec2 fma_26a7a9() {
  vec2 res = vec2(2.0f);
  return res;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  v.tint_symbol = fma_26a7a9();
}
#version 310 es


struct VertexOutput {
  vec4 pos;
  vec2 prevent_dce;
};

layout(location = 0) flat out vec2 vertex_main_loc0_Output;
vec2 fma_26a7a9() {
  vec2 res = vec2(2.0f);
  return res;
}
VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = VertexOutput(vec4(0.0f), vec2(0.0f));
  tint_symbol.pos = vec4(0.0f);
  tint_symbol.prevent_dce = fma_26a7a9();
  return tint_symbol;
}
void main() {
  VertexOutput v = vertex_main_inner();
  gl_Position = v.pos;
  gl_Position[1u] = -(gl_Position.y);
  gl_Position[2u] = ((2.0f * gl_Position.z) - gl_Position.w);
  vertex_main_loc0_Output = v.prevent_dce;
  gl_PointSize = 1.0f;
}
