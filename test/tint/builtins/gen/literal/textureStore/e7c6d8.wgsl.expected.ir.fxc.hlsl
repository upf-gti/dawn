
RWTexture1D<float4> arg_0 : register(u0, space1);
void textureStore_e7c6d8() {
  arg_0[1u] = (1.0f).xxxx;
}

void fragment_main() {
  textureStore_e7c6d8();
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_e7c6d8();
}

