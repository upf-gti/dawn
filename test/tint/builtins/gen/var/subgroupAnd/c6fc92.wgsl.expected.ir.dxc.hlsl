
RWByteAddressBuffer prevent_dce : register(u0);
int subgroupAnd_c6fc92() {
  int arg_0 = int(1);
  int res = asint(WaveActiveBitAnd(asuint(arg_0)));
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(subgroupAnd_c6fc92()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(subgroupAnd_c6fc92()));
}

