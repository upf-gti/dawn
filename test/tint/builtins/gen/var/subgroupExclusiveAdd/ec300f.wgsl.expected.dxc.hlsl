RWByteAddressBuffer prevent_dce : register(u0);

uint4 subgroupExclusiveAdd_ec300f() {
  uint4 arg_0 = (1u).xxxx;
  uint4 res = WavePrefixSum(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(subgroupExclusiveAdd_ec300f()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(subgroupExclusiveAdd_ec300f()));
  return;
}
