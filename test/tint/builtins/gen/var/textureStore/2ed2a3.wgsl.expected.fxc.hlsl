RWTexture1D<float4> arg_0 : register(u0, space1);

void textureStore_2ed2a3() {
  int arg_1 = 1;
  float4 arg_2 = (1.0f).xxxx;
  arg_0[arg_1] = arg_2;
}

void fragment_main() {
  textureStore_2ed2a3();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_2ed2a3();
  return;
}
