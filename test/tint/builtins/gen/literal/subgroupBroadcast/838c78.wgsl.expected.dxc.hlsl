RWByteAddressBuffer prevent_dce : register(u0);

float4 subgroupBroadcast_838c78() {
  float4 res = WaveReadLaneAt((1.0f).xxxx, 1);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(subgroupBroadcast_838c78()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(subgroupBroadcast_838c78()));
  return;
}
