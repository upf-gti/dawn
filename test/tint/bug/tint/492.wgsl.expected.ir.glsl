#version 310 es


struct S {
  int a;
};

layout(binding = 0, std430)
buffer tint_symbol_2_1_ssbo {
  S tint_symbol_1;
} v;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  v.tint_symbol_1.a = 12;
}
