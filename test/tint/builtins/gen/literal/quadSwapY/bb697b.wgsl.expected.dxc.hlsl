RWByteAddressBuffer prevent_dce : register(u0);

uint4 quadSwapY_bb697b() {
  uint4 res = QuadReadAcrossY((1u).xxxx);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(quadSwapY_bb697b()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(quadSwapY_bb697b()));
  return;
}
