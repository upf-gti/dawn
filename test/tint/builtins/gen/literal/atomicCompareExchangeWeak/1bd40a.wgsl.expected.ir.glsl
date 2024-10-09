#version 310 es
precision highp float;
precision highp int;


struct SB_RW {
  int arg_0;
};

struct atomic_compare_exchange_result_i32 {
  int old_value;
  bool exchanged;
};

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  SB_RW tint_symbol;
} v;
void atomicCompareExchangeWeak_1bd40a() {
  int v_1 = atomicCompSwap(v.tint_symbol.arg_0, 1, 1);
  atomic_compare_exchange_result_i32 res = atomic_compare_exchange_result_i32(v_1, (v_1 == 1));
}
void main() {
  atomicCompareExchangeWeak_1bd40a();
}
#version 310 es


struct SB_RW {
  int arg_0;
};

struct atomic_compare_exchange_result_i32 {
  int old_value;
  bool exchanged;
};

layout(binding = 0, std430)
buffer tint_symbol_1_1_ssbo {
  SB_RW tint_symbol;
} v;
void atomicCompareExchangeWeak_1bd40a() {
  int v_1 = atomicCompSwap(v.tint_symbol.arg_0, 1, 1);
  atomic_compare_exchange_result_i32 res = atomic_compare_exchange_result_i32(v_1, (v_1 == 1));
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  atomicCompareExchangeWeak_1bd40a();
}
