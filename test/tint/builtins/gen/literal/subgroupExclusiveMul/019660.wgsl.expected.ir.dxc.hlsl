
RWByteAddressBuffer prevent_dce : register(u0);
int4 subgroupExclusiveMul_019660() {
  int4 res = WavePrefixProduct((int(1)).xxxx);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(subgroupExclusiveMul_019660()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(subgroupExclusiveMul_019660()));
}

