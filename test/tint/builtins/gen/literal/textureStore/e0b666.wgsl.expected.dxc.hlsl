RWTexture1D<float4> arg_0 : register(u0, space1);

void textureStore_e0b666() {
  arg_0[1] = (1.0f).xxxx;
}

void fragment_main() {
  textureStore_e0b666();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_e0b666();
  return;
}
