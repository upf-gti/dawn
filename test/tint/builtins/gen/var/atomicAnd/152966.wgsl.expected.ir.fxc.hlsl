
RWByteAddressBuffer prevent_dce : register(u0);
RWByteAddressBuffer sb_rw : register(u1);
int atomicAnd_152966() {
  int arg_1 = 1;
  int v = arg_1;
  int v_1 = 0;
  sb_rw.InterlockedAnd(int(0u), v, v_1);
  int res = v_1;
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(atomicAnd_152966()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(atomicAnd_152966()));
}

