
RWByteAddressBuffer sb_rw : register(u0);
void atomicExchange_d59712() {
  uint res = 0u;
  uint v = 0u;
  sb_rw.InterlockedExchange(uint(0u), 1u, v);
  uint x_9 = v;
  res = x_9;
}

void fragment_main_1() {
  atomicExchange_d59712();
}

void fragment_main() {
  fragment_main_1();
}

void compute_main_1() {
  atomicExchange_d59712();
}

[numthreads(1, 1, 1)]
void compute_main() {
  compute_main_1();
}

