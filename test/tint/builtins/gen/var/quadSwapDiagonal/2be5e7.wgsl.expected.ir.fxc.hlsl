SKIP: Wave ops not supported before SM 6.0


RWByteAddressBuffer prevent_dce : register(u0);
float16_t quadSwapDiagonal_2be5e7() {
  float16_t arg_0 = float16_t(1.0h);
  float16_t res = QuadReadAcrossDiagonal(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store<float16_t>(0u, quadSwapDiagonal_2be5e7());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store<float16_t>(0u, quadSwapDiagonal_2be5e7());
}

