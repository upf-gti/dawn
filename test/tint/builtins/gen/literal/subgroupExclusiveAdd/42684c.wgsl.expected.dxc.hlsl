RWByteAddressBuffer prevent_dce : register(u0);

uint subgroupExclusiveAdd_42684c() {
  uint res = WavePrefixSum(1u);
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(subgroupExclusiveAdd_42684c()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, asuint(subgroupExclusiveAdd_42684c()));
  return;
}
