
RWTexture2DArray<uint4> arg_0 : register(u0, space1);
void textureStore_00ca64() {
  int2 arg_1 = (int(1)).xx;
  uint arg_2 = 1u;
  uint4 arg_3 = (1u).xxxx;
  int2 v = arg_1;
  uint4 v_1 = arg_3;
  arg_0[int3(v, int(arg_2))] = v_1;
}

void fragment_main() {
  textureStore_00ca64();
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_00ca64();
}

