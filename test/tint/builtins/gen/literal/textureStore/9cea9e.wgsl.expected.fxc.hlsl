RWTexture2DArray<uint4> arg_0 : register(u0, space1);

void textureStore_9cea9e() {
  arg_0[int3((1).xx, int(1u))] = (1u).xxxx;
}

void fragment_main() {
  textureStore_9cea9e();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_9cea9e();
  return;
}
