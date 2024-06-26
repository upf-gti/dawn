#version 310 es
precision highp float;
precision highp int;

uvec2 tint_select(uvec2 param_0, uvec2 param_1, bvec2 param_2) {
    return uvec2(param_2[0] ? param_1[0] : param_0[0], param_2[1] ? param_1[1] : param_0[1]);
}


uvec2 tint_first_leading_bit(uvec2 v) {
  uvec2 x = v;
  uvec2 b16 = tint_select(uvec2(0u), uvec2(16u), bvec2((x & uvec2(4294901760u))));
  x = (x >> b16);
  uvec2 b8 = tint_select(uvec2(0u), uvec2(8u), bvec2((x & uvec2(65280u))));
  x = (x >> b8);
  uvec2 b4 = tint_select(uvec2(0u), uvec2(4u), bvec2((x & uvec2(240u))));
  x = (x >> b4);
  uvec2 b2 = tint_select(uvec2(0u), uvec2(2u), bvec2((x & uvec2(12u))));
  x = (x >> b2);
  uvec2 b1 = tint_select(uvec2(0u), uvec2(1u), bvec2((x & uvec2(2u))));
  uvec2 is_zero = tint_select(uvec2(0u), uvec2(4294967295u), equal(x, uvec2(0u)));
  return uvec2((((((b16 | b8) | b4) | b2) | b1) | is_zero));
}

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  uvec2 inner;
} prevent_dce;

uvec2 firstLeadingBit_6fe804() {
  uvec2 arg_0 = uvec2(1u);
  uvec2 res = tint_first_leading_bit(arg_0);
  return res;
}

struct VertexOutput {
  vec4 pos;
  uvec2 prevent_dce;
};

void fragment_main() {
  prevent_dce.inner = firstLeadingBit_6fe804();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

uvec2 tint_select(uvec2 param_0, uvec2 param_1, bvec2 param_2) {
    return uvec2(param_2[0] ? param_1[0] : param_0[0], param_2[1] ? param_1[1] : param_0[1]);
}


uvec2 tint_first_leading_bit(uvec2 v) {
  uvec2 x = v;
  uvec2 b16 = tint_select(uvec2(0u), uvec2(16u), bvec2((x & uvec2(4294901760u))));
  x = (x >> b16);
  uvec2 b8 = tint_select(uvec2(0u), uvec2(8u), bvec2((x & uvec2(65280u))));
  x = (x >> b8);
  uvec2 b4 = tint_select(uvec2(0u), uvec2(4u), bvec2((x & uvec2(240u))));
  x = (x >> b4);
  uvec2 b2 = tint_select(uvec2(0u), uvec2(2u), bvec2((x & uvec2(12u))));
  x = (x >> b2);
  uvec2 b1 = tint_select(uvec2(0u), uvec2(1u), bvec2((x & uvec2(2u))));
  uvec2 is_zero = tint_select(uvec2(0u), uvec2(4294967295u), equal(x, uvec2(0u)));
  return uvec2((((((b16 | b8) | b4) | b2) | b1) | is_zero));
}

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  uvec2 inner;
} prevent_dce;

uvec2 firstLeadingBit_6fe804() {
  uvec2 arg_0 = uvec2(1u);
  uvec2 res = tint_first_leading_bit(arg_0);
  return res;
}

struct VertexOutput {
  vec4 pos;
  uvec2 prevent_dce;
};

void compute_main() {
  prevent_dce.inner = firstLeadingBit_6fe804();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
#version 310 es

uvec2 tint_select(uvec2 param_0, uvec2 param_1, bvec2 param_2) {
    return uvec2(param_2[0] ? param_1[0] : param_0[0], param_2[1] ? param_1[1] : param_0[1]);
}


uvec2 tint_first_leading_bit(uvec2 v) {
  uvec2 x = v;
  uvec2 b16 = tint_select(uvec2(0u), uvec2(16u), bvec2((x & uvec2(4294901760u))));
  x = (x >> b16);
  uvec2 b8 = tint_select(uvec2(0u), uvec2(8u), bvec2((x & uvec2(65280u))));
  x = (x >> b8);
  uvec2 b4 = tint_select(uvec2(0u), uvec2(4u), bvec2((x & uvec2(240u))));
  x = (x >> b4);
  uvec2 b2 = tint_select(uvec2(0u), uvec2(2u), bvec2((x & uvec2(12u))));
  x = (x >> b2);
  uvec2 b1 = tint_select(uvec2(0u), uvec2(1u), bvec2((x & uvec2(2u))));
  uvec2 is_zero = tint_select(uvec2(0u), uvec2(4294967295u), equal(x, uvec2(0u)));
  return uvec2((((((b16 | b8) | b4) | b2) | b1) | is_zero));
}

layout(location = 0) flat out uvec2 prevent_dce_1;
uvec2 firstLeadingBit_6fe804() {
  uvec2 arg_0 = uvec2(1u);
  uvec2 res = tint_first_leading_bit(arg_0);
  return res;
}

struct VertexOutput {
  vec4 pos;
  uvec2 prevent_dce;
};

VertexOutput vertex_main() {
  VertexOutput tint_symbol = VertexOutput(vec4(0.0f, 0.0f, 0.0f, 0.0f), uvec2(0u, 0u));
  tint_symbol.pos = vec4(0.0f);
  tint_symbol.prevent_dce = firstLeadingBit_6fe804();
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
