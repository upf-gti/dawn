struct VertexOutput {
  float4 pos;
  uint3 prevent_dce;
};

struct vertex_main_outputs {
  nointerpolation uint3 VertexOutput_prevent_dce : TEXCOORD0;
  float4 VertexOutput_pos : SV_Position;
};


RWByteAddressBuffer prevent_dce : register(u0);
uint3 clamp_548fc7() {
  uint3 arg_0 = (1u).xxx;
  uint3 arg_1 = (1u).xxx;
  uint3 arg_2 = (1u).xxx;
  uint3 v = arg_2;
  uint3 res = min(max(arg_0, arg_1), v);
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, clamp_548fc7());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, clamp_548fc7());
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = clamp_548fc7();
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

