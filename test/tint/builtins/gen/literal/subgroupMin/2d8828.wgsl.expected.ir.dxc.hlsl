
RWByteAddressBuffer prevent_dce : register(u0);
float2 subgroupMin_2d8828() {
  float2 res = WaveActiveMin((1.0f).xx);
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, asuint(subgroupMin_2d8828()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, asuint(subgroupMin_2d8828()));
}

