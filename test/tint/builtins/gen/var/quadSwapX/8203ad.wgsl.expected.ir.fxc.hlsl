SKIP: Wave ops not supported before SM 6.0


RWByteAddressBuffer prevent_dce : register(u0);
uint quadSwapX_8203ad() {
  uint arg_0 = 1u;
  uint res = QuadReadAcrossX(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, quadSwapX_8203ad());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, quadSwapX_8203ad());
}

