
RWByteAddressBuffer prevent_dce : register(u0);
uint3 quadSwapY_06a67c() {
  uint3 res = QuadReadAcrossY((1u).xxx);
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, quadSwapY_06a67c());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, quadSwapY_06a67c());
}

