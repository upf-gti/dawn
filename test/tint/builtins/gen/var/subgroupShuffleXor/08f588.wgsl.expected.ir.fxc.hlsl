SKIP: Wave ops not supported before SM 6.0


RWByteAddressBuffer prevent_dce : register(u0);
uint4 subgroupShuffleXor_08f588() {
  uint4 arg_0 = (1u).xxxx;
  uint arg_1 = 1u;
  uint4 v = arg_0;
  uint v_1 = arg_1;
  uint4 res = WaveReadLaneAt(v, (WaveGetLaneIndex() ^ v_1));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, subgroupShuffleXor_08f588());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, subgroupShuffleXor_08f588());
}

