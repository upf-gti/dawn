struct compute_main_inputs {
  uint tint_local_index : SV_GroupIndex;
};


RWByteAddressBuffer prevent_dce : register(u0);
groupshared uint arg_0;
uint atomicXor_c8e6be() {
  uint arg_1 = 1u;
  uint v = 0u;
  InterlockedXor(arg_0, arg_1, v);
  uint res = v;
  return res;
}

void compute_main_inner(uint tint_local_index) {
  if ((tint_local_index == 0u)) {
    uint v_1 = 0u;
    InterlockedExchange(arg_0, 0u, v_1);
  }
  GroupMemoryBarrierWithGroupSync();
  prevent_dce.Store(0u, atomicXor_c8e6be());
}

[numthreads(1, 1, 1)]
void compute_main(compute_main_inputs inputs) {
  compute_main_inner(inputs.tint_local_index);
}

