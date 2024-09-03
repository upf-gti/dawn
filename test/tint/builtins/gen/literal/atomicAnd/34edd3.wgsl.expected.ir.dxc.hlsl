struct compute_main_inputs {
  uint tint_local_index : SV_GroupIndex;
};


RWByteAddressBuffer prevent_dce : register(u0);
groupshared uint arg_0;
uint atomicAnd_34edd3() {
  uint v = 0u;
  InterlockedAnd(arg_0, 1u, v);
  uint res = v;
  return res;
}

void compute_main_inner(uint tint_local_index) {
  if ((tint_local_index == 0u)) {
    uint v_1 = 0u;
    InterlockedExchange(arg_0, 0u, v_1);
  }
  GroupMemoryBarrierWithGroupSync();
  prevent_dce.Store(0u, atomicAnd_34edd3());
}

[numthreads(1, 1, 1)]
void compute_main(compute_main_inputs inputs) {
  compute_main_inner(inputs.tint_local_index);
}

