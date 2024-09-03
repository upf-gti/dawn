struct VertexOutput {
  float4 pos;
  uint4 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation uint4 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


RWByteAddressBuffer prevent_dce : register(u0);
uint4 countOneBits_0d0e46() {
  uint4 arg_0 = (1u).xxxx;
  uint4 res = countbits(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, countOneBits_0d0e46());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, countOneBits_0d0e46());
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = countOneBits_0d0e46();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  VertexOutput v_2 = v_1;
  VertexOutput v_3 = v_1;
  vertex_main_outputs v_4 = {v_3.prevent_dce, v_2.pos};
  return v_4;
}

