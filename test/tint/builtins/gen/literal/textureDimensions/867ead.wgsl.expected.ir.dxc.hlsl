
RWByteAddressBuffer prevent_dce : register(u0);
RWTexture2DArray<float4> arg_0 : register(u0, space1);
uint2 textureDimensions_867ead() {
  uint3 v = (0u).xxx;
  arg_0.GetDimensions(v[0u], v[1u], v[2u]);
  uint2 res = v.xy;
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, textureDimensions_867ead());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, textureDimensions_867ead());
}

