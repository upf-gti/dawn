struct VertexOutput {
  float4 pos;
};

struct vertex_main_outputs {
  float4 VertexOutput_pos : SV_Position;
};


void transpose_553e90() {
  float2x4 res = float2x4((1.0f).xxxx, (1.0f).xxxx);
}

void fragment_main() {
  transpose_553e90();
}

[numthreads(1, 1, 1)]
void compute_main() {
  transpose_553e90();
}

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  transpose_553e90();
  VertexOutput v = tint_symbol;
  return v;
}

vertex_main_outputs vertex_main() {
  VertexOutput v_1 = vertex_main_inner();
  vertex_main_outputs v_2 = {v_1.pos};
  return v_2;
}

