SKIP: INVALID

RWByteAddressBuffer prevent_dce : register(u0);

float2 subgroupMin_2d8828() {
  float2 res = WaveActiveMin((1.0f).xx);
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, asuint(subgroupMin_2d8828()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, asuint(subgroupMin_2d8828()));
  return;
}
FXC validation failure:
<scrubbed_path>(4,16-39): error X3004: undeclared identifier 'WaveActiveMin'


tint executable returned error: exit status 1
