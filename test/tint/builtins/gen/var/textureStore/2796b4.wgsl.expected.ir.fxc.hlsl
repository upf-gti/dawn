
RWTexture3D<int4> arg_0 : register(u0, space1);
void textureStore_2796b4() {
  int3 arg_1 = (int(1)).xxx;
  int4 arg_2 = (int(1)).xxxx;
  arg_0[arg_1] = arg_2;
}

void fragment_main() {
  textureStore_2796b4();
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_2796b4();
}

