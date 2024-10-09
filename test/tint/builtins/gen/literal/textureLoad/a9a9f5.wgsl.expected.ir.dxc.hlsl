struct VertexOutput {
  float4 pos;
  uint4 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation uint4 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


RWByteAddressBuffer prevent_dce : register(u0);
Texture3D<uint4> arg_0 : register(t0, space1);
uint4 textureLoad_a9a9f5() {
  int3 v = int3((int(1)).xxx);
  uint4 res = uint4(arg_0.Load(int4(v, int(int(1)))));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, textureLoad_a9a9f5());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, textureLoad_a9a9f5());
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = textureLoad_a9a9f5();
  VertexOutput v_1 = tint_symbol;
  return v_1;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_2 = vertex_main_inner();
  VertexOutput v_3 = v_2;
  VertexOutput v_4 = v_2;
  vertex_main_outputs v_5 = {v_4.prevent_dce, v_3.pos};
  return v_5;
}

