
RWByteAddressBuffer prevent_dce : register(u0);
RWTexture2DArray<float4> arg_0 : register(u0, space1);
float4 textureLoad_a92b18() {
  uint2 arg_1 = (1u).xx;
  int arg_2 = int(1);
  int v = arg_2;
  int2 v_1 = int2(arg_1);
  float4 res = float4(arg_0.Load(int4(v_1, int(v), int(0))));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_a92b18()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_a92b18()));
}

