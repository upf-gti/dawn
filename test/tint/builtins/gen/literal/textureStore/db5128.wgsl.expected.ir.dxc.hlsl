
RWTexture2DArray<uint4> arg_0 : register(u0, space1);
void textureStore_db5128() {
  RWTexture2DArray<uint4> v = arg_0;
  v[int3((1).xx, int(1u))] = (1u).xxxx;
}

void fragment_main() {
  textureStore_db5128();
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_db5128();
}

