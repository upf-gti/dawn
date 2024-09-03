struct atomic_compare_exchange_result_i32 {
  int old_value;
  bool exchanged;
};

struct compute_main_inputs {
  uint tint_local_index : SV_GroupIndex;
};


groupshared int arg_0;
void atomicCompareExchangeWeak_e88938() {
  int arg_1 = 1;
  int arg_2 = 1;
  int v = arg_1;
  int v_1 = 0;
  InterlockedCompareExchange(arg_0, v, arg_2, v_1);
  int v_2 = v_1;
  atomic_compare_exchange_result_i32 res = {v_2, (v_2 == v)};
}

void compute_main_inner(uint tint_local_index) {
  if ((tint_local_index == 0u)) {
    int v_3 = 0;
    InterlockedExchange(arg_0, 0, v_3);
  }
  GroupMemoryBarrierWithGroupSync();
  atomicCompareExchangeWeak_e88938();
}

[numthreads(1, 1, 1)]
void compute_main(compute_main_inputs inputs) {
  compute_main_inner(inputs.tint_local_index);
}

