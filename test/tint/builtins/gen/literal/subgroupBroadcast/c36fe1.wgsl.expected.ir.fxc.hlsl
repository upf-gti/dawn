SKIP: INVALID


RWByteAddressBuffer prevent_dce : register(u0);
uint subgroupBroadcast_c36fe1() {
  uint res = WaveReadLaneAt(1u, 1u);
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, subgroupBroadcast_c36fe1());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, subgroupBroadcast_c36fe1());
}

FXC validation failure:
<scrubbed_path>(4,14-35): error X3004: undeclared identifier 'WaveReadLaneAt'


tint executable returned error: exit status 1
