RWByteAddressBuffer prevent_dce : register(u0);
RWTexture3D<uint4> arg_0 : register(u0, space1);

uint4 textureLoad_19d6be() {
  uint4 res = arg_0.Load((1u).xxx);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_19d6be()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_19d6be()));
  return;
}
