
RWTexture2DArray<float4> arg_0 : register(u0, space1);
void textureStore_699a1b() {
  uint2 arg_1 = (1u).xx;
  uint arg_2 = 1u;
  float4 arg_3 = (1.0f).xxxx;
  RWTexture2DArray<float4> v = arg_0;
  uint2 v_1 = arg_1;
  float4 v_2 = arg_3;
  v[uint3(v_1, uint(arg_2))] = v_2;
}

void fragment_main() {
  textureStore_699a1b();
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_699a1b();
}

