RWByteAddressBuffer prevent_dce : register(u0);
Texture2D<float4> arg_0 : register(t0, space1);
SamplerState arg_1 : register(s1, space1);

float4 textureSample_51b514() {
  float2 arg_2 = (1.0f).xx;
  float4 res = arg_0.Sample(arg_1, arg_2);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(textureSample_51b514()));
  return;
}
