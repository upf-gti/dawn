RWByteAddressBuffer prevent_dce : register(u0);
RWTexture1D<int4> arg_0 : register(u0, space1);

int4 textureLoad_cac876() {
  int4 res = arg_0.Load(1u);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_cac876()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_cac876()));
  return;
}
