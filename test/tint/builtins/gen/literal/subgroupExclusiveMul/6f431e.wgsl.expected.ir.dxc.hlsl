
RWByteAddressBuffer prevent_dce : register(u0);
float16_t subgroupExclusiveMul_6f431e() {
  float16_t res = WavePrefixProduct(float16_t(1.0h));
  return res;
}

void fragment_main() {
  prevent_dce.Store<float16_t>(0u, subgroupExclusiveMul_6f431e());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store<float16_t>(0u, subgroupExclusiveMul_6f431e());
}

