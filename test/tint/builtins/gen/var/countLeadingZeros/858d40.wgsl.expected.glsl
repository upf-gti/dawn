#version 310 es
precision highp float;
precision highp int;

ivec2 tint_count_leading_zeros(ivec2 v) {
  uvec2 x = uvec2(v);
  uvec2 b16 = mix(uvec2(0u), uvec2(16u), lessThanEqual(x, uvec2(65535u)));
  x = (x << b16);
  uvec2 b8 = mix(uvec2(0u), uvec2(8u), lessThanEqual(x, uvec2(16777215u)));
  x = (x << b8);
  uvec2 b4 = mix(uvec2(0u), uvec2(4u), lessThanEqual(x, uvec2(268435455u)));
  x = (x << b4);
  uvec2 b2 = mix(uvec2(0u), uvec2(2u), lessThanEqual(x, uvec2(1073741823u)));
  x = (x << b2);
  uvec2 b1 = mix(uvec2(0u), uvec2(1u), lessThanEqual(x, uvec2(2147483647u)));
  uvec2 is_zero = mix(uvec2(0u), uvec2(1u), equal(x, uvec2(0u)));
  return ivec2((((((b16 | b8) | b4) | b2) | b1) + is_zero));
}

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  ivec2 inner;
} prevent_dce;

ivec2 countLeadingZeros_858d40() {
  ivec2 arg_0 = ivec2(1);
  ivec2 res = tint_count_leading_zeros(arg_0);
  return res;
}

struct VertexOutput {
  vec4 pos;
  ivec2 prevent_dce;
};

void fragment_main() {
  prevent_dce.inner = countLeadingZeros_858d40();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

ivec2 tint_count_leading_zeros(ivec2 v) {
  uvec2 x = uvec2(v);
  uvec2 b16 = mix(uvec2(0u), uvec2(16u), lessThanEqual(x, uvec2(65535u)));
  x = (x << b16);
  uvec2 b8 = mix(uvec2(0u), uvec2(8u), lessThanEqual(x, uvec2(16777215u)));
  x = (x << b8);
  uvec2 b4 = mix(uvec2(0u), uvec2(4u), lessThanEqual(x, uvec2(268435455u)));
  x = (x << b4);
  uvec2 b2 = mix(uvec2(0u), uvec2(2u), lessThanEqual(x, uvec2(1073741823u)));
  x = (x << b2);
  uvec2 b1 = mix(uvec2(0u), uvec2(1u), lessThanEqual(x, uvec2(2147483647u)));
  uvec2 is_zero = mix(uvec2(0u), uvec2(1u), equal(x, uvec2(0u)));
  return ivec2((((((b16 | b8) | b4) | b2) | b1) + is_zero));
}

layout(binding = 0, std430) buffer prevent_dce_block_ssbo {
  ivec2 inner;
} prevent_dce;

ivec2 countLeadingZeros_858d40() {
  ivec2 arg_0 = ivec2(1);
  ivec2 res = tint_count_leading_zeros(arg_0);
  return res;
}

struct VertexOutput {
  vec4 pos;
  ivec2 prevent_dce;
};

void compute_main() {
  prevent_dce.inner = countLeadingZeros_858d40();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
#version 310 es

ivec2 tint_count_leading_zeros(ivec2 v) {
  uvec2 x = uvec2(v);
  uvec2 b16 = mix(uvec2(0u), uvec2(16u), lessThanEqual(x, uvec2(65535u)));
  x = (x << b16);
  uvec2 b8 = mix(uvec2(0u), uvec2(8u), lessThanEqual(x, uvec2(16777215u)));
  x = (x << b8);
  uvec2 b4 = mix(uvec2(0u), uvec2(4u), lessThanEqual(x, uvec2(268435455u)));
  x = (x << b4);
  uvec2 b2 = mix(uvec2(0u), uvec2(2u), lessThanEqual(x, uvec2(1073741823u)));
  x = (x << b2);
  uvec2 b1 = mix(uvec2(0u), uvec2(1u), lessThanEqual(x, uvec2(2147483647u)));
  uvec2 is_zero = mix(uvec2(0u), uvec2(1u), equal(x, uvec2(0u)));
  return ivec2((((((b16 | b8) | b4) | b2) | b1) + is_zero));
}

layout(location = 0) flat out ivec2 prevent_dce_1;
ivec2 countLeadingZeros_858d40() {
  ivec2 arg_0 = ivec2(1);
  ivec2 res = tint_count_leading_zeros(arg_0);
  return res;
}

struct VertexOutput {
  vec4 pos;
  ivec2 prevent_dce;
};

VertexOutput vertex_main() {
  VertexOutput tint_symbol = VertexOutput(vec4(0.0f, 0.0f, 0.0f, 0.0f), ivec2(0, 0));
  tint_symbol.pos = vec4(0.0f);
  tint_symbol.prevent_dce = countLeadingZeros_858d40();
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
