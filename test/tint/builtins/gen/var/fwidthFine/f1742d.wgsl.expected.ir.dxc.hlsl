
RWByteAddressBuffer prevent_dce : register(u0);
float fwidthFine_f1742d() {
  float arg_0 = 1.0f;
  float res = fwidth(arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store(0u, asuint(fwidthFine_f1742d()));
}

