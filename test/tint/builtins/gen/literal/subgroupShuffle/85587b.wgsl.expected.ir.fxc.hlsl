SKIP: INVALID


RWByteAddressBuffer prevent_dce : register(u0);
float4 subgroupShuffle_85587b() {
  float4 res = WaveReadLaneAt((1.0f).xxxx, 1u);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(subgroupShuffle_85587b()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(subgroupShuffle_85587b()));
}

FXC validation failure:
<scrubbed_path>(4,16-46): error X3004: undeclared identifier 'WaveReadLaneAt'


tint executable returned error: exit status 1
