
RWByteAddressBuffer prevent_dce : register(u0);
RWTexture2DArray<float4> arg_0 : register(u0, space1);
uint textureNumLayers_5ee8f2() {
  uint3 v = (0u).xxx;
  arg_0.GetDimensions(v[0u], v[1u], v[2u]);
  uint res = v.z;
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, textureNumLayers_5ee8f2());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store(0u, textureNumLayers_5ee8f2());
}

