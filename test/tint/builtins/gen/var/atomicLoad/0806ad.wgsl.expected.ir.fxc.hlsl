
RWByteAddressBuffer prevent_dce : register(u0);
RWByteAddressBuffer sb_rw : register(u1);
int atomicLoad_0806ad() {
  int v = 0;
  sb_rw.InterlockedOr(int(0u), 0, v);
  int res = v;
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(atomicLoad_0806ad()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(atomicLoad_0806ad()));
}

