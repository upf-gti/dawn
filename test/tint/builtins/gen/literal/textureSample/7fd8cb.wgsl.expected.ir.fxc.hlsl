
RWByteAddressBuffer prevent_dce : register(u0);
TextureCubeArray arg_0 : register(t0, space1);
SamplerState arg_1 : register(s1, space1);
float textureSample_7fd8cb() {
  TextureCubeArray v = arg_0;
  SamplerState v_1 = arg_1;
  float res = v.Sample(v_1, float4((1.0f).xxx, float(1u)));
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(textureSample_7fd8cb()));
}

