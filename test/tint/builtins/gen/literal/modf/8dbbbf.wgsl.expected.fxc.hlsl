SKIP: INVALID

struct modf_result_f16 {
  float16_t fract;
  float16_t whole;
};
void modf_8dbbbf() {
  modf_result_f16 res = {float16_t(-0.5h), float16_t(-1.0h)};
}

void fragment_main() {
  modf_8dbbbf();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  modf_8dbbbf();
  return;
}

struct VertexOutput {
  float4 pos;
};
struct tint_symbol_1 {
  float4 pos : SV_Position;
};

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  modf_8dbbbf();
  return tint_symbol;
}

tint_symbol_1 vertex_main() {
  VertexOutput inner_result = vertex_main_inner();
  tint_symbol_1 wrapper_result = (tint_symbol_1)0;
  wrapper_result.pos = inner_result.pos;
  return wrapper_result;
}
FXC validation failure:
<scrubbed_path>(2,3-11): error X3000: unrecognized identifier 'float16_t'


tint executable returned error: exit status 1
