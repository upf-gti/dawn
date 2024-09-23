struct compute_main_inputs {
  uint tint_local_index : SV_GroupIndex;
};


RWByteAddressBuffer prevent_dce : register(u0);
groupshared int arg_0;
int atomicExchange_e114ba() {
  int arg_1 = 1;
  int v = 0;
  InterlockedExchange(arg_0, arg_1, v);
  int res = v;
  return res;
}

void compute_main_inner(uint tint_local_index) {
  if ((tint_local_index == 0u)) {
    int v_1 = 0;
    InterlockedExchange(arg_0, 0, v_1);
  }
  GroupMemoryBarrierWithGroupSync();
  prevent_dce.Store(0u, asuint(atomicExchange_e114ba()));
}

[numthreads(1, 1, 1)]
void compute_main(compute_main_inputs inputs) {
  compute_main_inner(inputs.tint_local_index);
}

