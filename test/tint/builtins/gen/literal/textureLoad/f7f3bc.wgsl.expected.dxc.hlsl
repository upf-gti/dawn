RWByteAddressBuffer prevent_dce : register(u0);
RWTexture1D<float4> arg_0 : register(u0, space1);

float4 textureLoad_f7f3bc() {
  float4 res = arg_0.Load(1);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_f7f3bc()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_f7f3bc()));
  return;
}
