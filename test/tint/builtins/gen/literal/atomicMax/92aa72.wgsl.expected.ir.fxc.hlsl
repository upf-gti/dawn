
RWByteAddressBuffer prevent_dce : register(u0);
RWByteAddressBuffer sb_rw : register(u1);
int atomicMax_92aa72() {
  int v = 0;
  sb_rw.InterlockedMax(int(0u), 1, v);
  int res = v;
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(atomicMax_92aa72()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(atomicMax_92aa72()));
}

