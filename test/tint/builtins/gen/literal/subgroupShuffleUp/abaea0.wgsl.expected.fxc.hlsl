SKIP: INVALID

RWByteAddressBuffer prevent_dce : register(u0);

uint3 subgroupShuffleUp_abaea0() {
  uint3 res = WaveReadLaneAt((1u).xxx, (WaveGetLaneIndex() - 1u));
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, asuint(subgroupShuffleUp_abaea0()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, asuint(subgroupShuffleUp_abaea0()));
  return;
}
FXC validation failure:
<scrubbed_path>(4,41-58): error X3004: undeclared identifier 'WaveGetLaneIndex'


tint executable returned error: exit status 1
