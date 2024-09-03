struct VertexOutput {
  float4 pos;
  uint4 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation uint4 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


RWByteAddressBuffer prevent_dce : register(u0);
Texture2DArray<uint4> arg_1 : register(t1, space1);
SamplerState arg_2 : register(s2, space1);
uint4 textureGather_6b7b74() {
  float2 arg_3 = (1.0f).xx;
  uint arg_4 = 1u;
  Texture2DArray<uint4> v = arg_1;
  SamplerState v_1 = arg_2;
  float2 v_2 = arg_3;
  uint4 res = v.GatherGreen(v_1, float3(v_2, float(arg_4)), (1).xx);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, textureGather_6b7b74());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, textureGather_6b7b74());
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = textureGather_6b7b74();
  VertexOutput v_3 = tint_symbol;
  return v_3;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_4 = vertex_main_inner();
  VertexOutput v_5 = v_4;
  VertexOutput v_6 = v_4;
  vertex_main_outputs v_7 = {v_6.prevent_dce, v_5.pos};
  return v_7;
}

