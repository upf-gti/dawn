
RWByteAddressBuffer prevent_dce : register(u0);
uint4 subgroupExclusiveMul_000b92() {
  uint4 arg_0 = (1u).xxxx;
  uint4 res = WavePrefixProduct(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, subgroupExclusiveMul_000b92());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, subgroupExclusiveMul_000b92());
}

