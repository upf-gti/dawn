SKIP: INVALID


RWByteAddressBuffer prevent_dce : register(u0);
uint2 subgroupExclusiveMul_d1d490() {
  uint2 arg_0 = (1u).xx;
  uint2 res = WavePrefixProduct(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, subgroupExclusiveMul_d1d490());
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, subgroupExclusiveMul_d1d490());
}

FXC validation failure:
<scrubbed_path>(5,15-38): error X3004: undeclared identifier 'WavePrefixProduct'


tint executable returned error: exit status 1
