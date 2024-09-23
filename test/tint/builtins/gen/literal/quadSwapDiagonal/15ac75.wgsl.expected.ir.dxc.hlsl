
RWByteAddressBuffer prevent_dce : register(u0);
vector<float16_t, 2> quadSwapDiagonal_15ac75() {
  vector<float16_t, 2> res = QuadReadAcrossDiagonal((float16_t(1.0h)).xx);
  return res;
}

void fragment_main() {
  prevent_dce.Store<vector<float16_t, 2> >(0u, quadSwapDiagonal_15ac75());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store<vector<float16_t, 2> >(0u, quadSwapDiagonal_15ac75());
}

