
RWTexture2DArray<int4> arg_0 : register(u0, space1);
void textureStore_1c02e7() {
  RWTexture2DArray<int4> v = arg_0;
  v[int3((1).xx, int(1))] = (1).xxxx;
}

void fragment_main() {
  textureStore_1c02e7();
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_1c02e7();
}

