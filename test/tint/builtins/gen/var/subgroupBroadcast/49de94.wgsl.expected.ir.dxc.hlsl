
RWByteAddressBuffer prevent_dce : register(u0);
uint subgroupBroadcast_49de94() {
  uint arg_0 = 1u;
  uint res = WaveReadLaneAt(arg_0, int(1));
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, subgroupBroadcast_49de94());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, subgroupBroadcast_49de94());
}

