RWByteAddressBuffer prevent_dce : register(u0);

float3 subgroupExclusiveMul_0a04d5() {
  float3 res = WavePrefixProduct((1.0f).xxx);
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, asuint(subgroupExclusiveMul_0a04d5()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store3(0u, asuint(subgroupExclusiveMul_0a04d5()));
  return;
}
