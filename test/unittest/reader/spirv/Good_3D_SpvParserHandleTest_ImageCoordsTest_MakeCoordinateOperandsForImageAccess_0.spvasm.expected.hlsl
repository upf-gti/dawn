SamplerState x_10 : register(s0, space0);
Texture3D<float4> x_20 : register(t1, space2);
SamplerState x_30 : register(s1, space0);

void main_1() {
  float float_var = 0.0f;
  const int i1 = 1;
  const int2 vi12 = int2(1, 2);
  const int3 vi123 = int3(1, 2, 3);
  const int4 vi1234 = int4(1, 2, 3, 4);
  const uint u1 = 1u;
  const uint2 vu12 = uint2(1u, 2u);
  const uint3 vu123 = uint3(1u, 2u, 3u);
  const uint4 vu1234 = uint4(1u, 2u, 3u, 4u);
  const float f1 = 1.0f;
  const float2 vf12 = float2(1.0f, 2.0f);
  const float3 vf123 = float3(1.0f, 2.0f, 3.0f);
  const float4 vf1234 = float4(1.0f, 2.0f, 3.0f, 4.0f);
  const float4 x_73 = x_20.Sample(x_10, vf123);
  const uint x_1000 = 0u;
  return;
}

void main() {
  main_1();
  return;
}
