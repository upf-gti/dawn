SKIP: Wave ops not supported before SM 6.0


RWByteAddressBuffer prevent_dce : register(u0);
uint subgroupShuffleDown_d90c2f() {
  uint res = WaveReadLaneAt(1u, (WaveGetLaneIndex() + 1u));
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, subgroupShuffleDown_d90c2f());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, subgroupShuffleDown_d90c2f());
}

