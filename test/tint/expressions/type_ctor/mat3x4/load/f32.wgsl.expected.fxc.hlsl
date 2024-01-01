RWByteAddressBuffer tint_symbol : register(u0);

void tint_symbol_store(uint offset, float3x4 value) {
  tint_symbol.Store4((offset + 0u), asuint(value[0u]));
  tint_symbol.Store4((offset + 16u), asuint(value[1u]));
  tint_symbol.Store4((offset + 32u), asuint(value[2u]));
}

[numthreads(1, 1, 1)]
void f() {
  float3x4 m = float3x4((0.0f).xxxx, (0.0f).xxxx, (0.0f).xxxx);
  tint_symbol_store(0u, float3x4(m));
  return;
}
