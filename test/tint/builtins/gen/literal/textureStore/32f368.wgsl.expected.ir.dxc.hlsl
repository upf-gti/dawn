
RWTexture2DArray<float4> arg_0 : register(u0, space1);
void textureStore_32f368() {
  RWTexture2DArray<float4> v = arg_0;
  v[int3((1).xx, int(1))] = (1.0f).xxxx;
}

void fragment_main() {
  textureStore_32f368();
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_32f368();
}

