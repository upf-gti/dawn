
RWTexture2DArray<float4> arg_0 : register(u0, space1);
void textureStore_699a1b() {
  RWTexture2DArray<float4> v = arg_0;
  v[uint3((1u).xx, uint(1u))] = (1.0f).xxxx;
}

void fragment_main() {
  textureStore_699a1b();
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_699a1b();
}

