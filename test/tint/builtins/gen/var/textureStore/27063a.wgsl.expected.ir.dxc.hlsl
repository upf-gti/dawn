
RWTexture2DArray<float4> arg_0 : register(u0, space1);
void textureStore_27063a() {
  uint2 arg_1 = (1u).xx;
  int arg_2 = int(1);
  float4 arg_3 = (1.0f).xxxx;
  uint2 v = arg_1;
  float4 v_1 = arg_3;
  arg_0[uint3(v, uint(arg_2))] = v_1;
}

void fragment_main() {
  textureStore_27063a();
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_27063a();
}

