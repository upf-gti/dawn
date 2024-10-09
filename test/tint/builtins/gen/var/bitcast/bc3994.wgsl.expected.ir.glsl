#version 310 es
#extension GL_AMD_gpu_shader_half_float: require
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  f16vec4 tint_symbol;
} v;
f16vec4 tint_bitcast_to_f16(uvec2 src) {
  uvec2 v_1 = uvec2(src);
  f16vec2 v_2 = unpackFloat2x16(v_1.x);
  return f16vec4(v_2, unpackFloat2x16(v_1.y));
}
f16vec4 bitcast_bc3994() {
  uvec2 arg_0 = uvec2(1u);
  f16vec4 res = tint_bitcast_to_f16(arg_0);
  return res;
}
void main() {
  v.tint_symbol = bitcast_bc3994();
}
#version 310 es
#extension GL_AMD_gpu_shader_half_float: require

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  f16vec4 tint_symbol;
} v;
f16vec4 tint_bitcast_to_f16(uvec2 src) {
  uvec2 v_1 = uvec2(src);
  f16vec2 v_2 = unpackFloat2x16(v_1.x);
  return f16vec4(v_2, unpackFloat2x16(v_1.y));
}
f16vec4 bitcast_bc3994() {
  uvec2 arg_0 = uvec2(1u);
  f16vec4 res = tint_bitcast_to_f16(arg_0);
  return res;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  v.tint_symbol = bitcast_bc3994();
}
#version 310 es
#extension GL_AMD_gpu_shader_half_float: require


struct VertexOutput {
  vec4 pos;
  f16vec4 prevent_dce;
};

layout(location = 0) flat out f16vec4 vertex_main_loc0_Output;
f16vec4 tint_bitcast_to_f16(uvec2 src) {
  uvec2 v = uvec2(src);
  f16vec2 v_1 = unpackFloat2x16(v.x);
  return f16vec4(v_1, unpackFloat2x16(v.y));
}
f16vec4 bitcast_bc3994() {
  uvec2 arg_0 = uvec2(1u);
  f16vec4 res = tint_bitcast_to_f16(arg_0);
  return res;
}
VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = VertexOutput(vec4(0.0f), f16vec4(0.0hf));
  tint_symbol.pos = vec4(0.0f);
  tint_symbol.prevent_dce = bitcast_bc3994();
  return tint_symbol;
}
void main() {
  VertexOutput v_2 = vertex_main_inner();
  gl_Position = v_2.pos;
  gl_Position[1u] = -(gl_Position.y);
  gl_Position[2u] = ((2.0f * gl_Position.z) - gl_Position.w);
  vertex_main_loc0_Output = v_2.prevent_dce;
  gl_PointSize = 1.0f;
}
