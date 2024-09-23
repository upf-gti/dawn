struct VertexOutput {
  float4 pos;
  int prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation int VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


RWByteAddressBuffer prevent_dce : register(u0);
int firstTrailingBit_3a2acc() {
  int arg_0 = 1;
  uint v = asuint(arg_0);
  uint v_1 = ((((v & 65535u) == 0u)) ? (16u) : (0u));
  uint v_2 = (((((v >> v_1) & 255u) == 0u)) ? (8u) : (0u));
  uint v_3 = ((((((v >> v_1) >> v_2) & 15u) == 0u)) ? (4u) : (0u));
  uint v_4 = (((((((v >> v_1) >> v_2) >> v_3) & 3u) == 0u)) ? (2u) : (0u));
  int res = asint((((((((v >> v_1) >> v_2) >> v_3) >> v_4) == 0u)) ? (4294967295u) : ((v_1 | (v_2 | (v_3 | (v_4 | ((((((((v >> v_1) >> v_2) >> v_3) >> v_4) & 1u) == 0u)) ? (1u) : (0u)))))))));
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(firstTrailingBit_3a2acc()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(firstTrailingBit_3a2acc()));
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = firstTrailingBit_3a2acc();
  VertexOutput v_5 = tint_symbol;
  return v_5;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_6 = vertex_main_inner();
  VertexOutput v_7 = v_6;
  VertexOutput v_8 = v_6;
  vertex_main_outputs v_9 = {v_8.prevent_dce, v_7.pos};
  return v_9;
}

