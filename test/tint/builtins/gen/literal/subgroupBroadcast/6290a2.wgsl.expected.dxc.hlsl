RWByteAddressBuffer prevent_dce : register(u0);

int4 subgroupBroadcast_6290a2() {
  int4 res = WaveReadLaneAt((1).xxxx, 1);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(subgroupBroadcast_6290a2()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(subgroupBroadcast_6290a2()));
  return;
}
