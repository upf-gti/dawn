
RWByteAddressBuffer prevent_dce : register(u0);
float3 subgroupShuffleDown_5d8b9f() {
  float3 arg_0 = (1.0f).xxx;
  uint arg_1 = 1u;
  float3 v = arg_0;
  uint v_1 = arg_1;
  float3 res = WaveReadLaneAt(v, (WaveGetLaneIndex() + v_1));
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, asuint(subgroupShuffleDown_5d8b9f()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, asuint(subgroupShuffleDown_5d8b9f()));
}

