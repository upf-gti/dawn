
RWByteAddressBuffer prevent_dce : register(u0);
RWByteAddressBuffer sb_rw : register(u1);
uint atomicMin_c67a74() {
  uint v = 0u;
  sb_rw.InterlockedMin(uint(0u), 1u, v);
  uint res = v;
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, atomicMin_c67a74());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, atomicMin_c67a74());
}

