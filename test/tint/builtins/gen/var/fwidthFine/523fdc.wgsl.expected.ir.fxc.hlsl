
RWByteAddressBuffer prevent_dce : register(u0);
float3 fwidthFine_523fdc() {
  float3 arg_0 = (1.0f).xxx;
  float3 v = arg_0;
  float3 v_1 = ddx_fine(v);
  float3 v_2 = ddy_fine(v);
  float3 v_3 = abs(v_1);
  float3 res = (v_3 + abs(v_2));
  return res;
}

void fragment_main() {
  prevent_dce.Store3(0u, asuint(fwidthFine_523fdc()));
}

