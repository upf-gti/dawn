RWByteAddressBuffer prevent_dce : register(u0);

int2 quadBroadcast_c0e704() {
  int2 arg_0 = (1).xx;
  int2 res = QuadReadLaneAt(arg_0, 1);
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, asuint(quadBroadcast_c0e704()));
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, asuint(quadBroadcast_c0e704()));
  return;
}
