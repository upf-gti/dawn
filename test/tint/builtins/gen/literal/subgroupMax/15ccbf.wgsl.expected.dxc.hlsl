RWByteAddressBuffer prevent_dce : register(u0);

uint4 subgroupMax_15ccbf() {
  uint4 res = WaveActiveMax((1u).xxxx);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(subgroupMax_15ccbf()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(subgroupMax_15ccbf()));
  return;
}
