
RWByteAddressBuffer prevent_dce : register(u0);
vector<float16_t, 4> subgroupInclusiveMul_4430d5() {
  vector<float16_t, 4> arg_0 = (float16_t(1.0h)).xxxx;
  vector<float16_t, 4> v = arg_0;
  vector<float16_t, 4> res = (WavePrefixProduct(v) * v);
  return res;
}

void fragment_main() {
  prevent_dce.Store<vector<float16_t, 4> >(0u, subgroupInclusiveMul_4430d5());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store<vector<float16_t, 4> >(0u, subgroupInclusiveMul_4430d5());
}

