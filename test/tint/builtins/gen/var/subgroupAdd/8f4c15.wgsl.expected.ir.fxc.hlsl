SKIP: INVALID


RWByteAddressBuffer prevent_dce : register(u0);
float4 subgroupAdd_8f4c15() {
  float4 arg_0 = (1.0f).xxxx;
  float4 res = WaveActiveSum(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(subgroupAdd_8f4c15()));
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store4(0u, asuint(subgroupAdd_8f4c15()));
}

FXC validation failure:
<scrubbed_path>(5,16-35): error X3004: undeclared identifier 'WaveActiveSum'


tint executable returned error: exit status 1
