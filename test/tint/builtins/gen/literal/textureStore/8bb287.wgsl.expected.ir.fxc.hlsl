
RWTexture2DArray<int4> arg_0 : register(u0, space1);
void textureStore_8bb287() {
  RWTexture2DArray<int4> v = arg_0;
  v[uint3((1u).xx, uint(1u))] = (1).xxxx;
}

void fragment_main() {
  textureStore_8bb287();
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_8bb287();
}

