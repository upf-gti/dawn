
RWByteAddressBuffer prevent_dce : register(u0);
float4 fwidthFine_68f4ef() {
  float4 res = fwidth((1.0f).xxxx);
  return res;
}

void fragment_main() {
  prevent_dce.Store4(0u, asuint(fwidthFine_68f4ef()));
}

