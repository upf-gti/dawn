
RWByteAddressBuffer prevent_dce : register(u0);
RWTexture2DArray<int4> arg_0 : register(u0, space1);
int4 textureLoad_a54e11() {
  RWTexture2DArray<int4> v = arg_0;
  int2 v_1 = int2((1).xx);
  int4 res = int4(v.Load(int4(v_1, int(1u), 0)));
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_a54e11()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(textureLoad_a54e11()));
}

