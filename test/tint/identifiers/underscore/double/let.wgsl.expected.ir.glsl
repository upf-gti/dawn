#version 310 es

layout(binding = 0, std430)
buffer tint_symbol_3_1_ssbo {
  int tint_symbol_2;
} v;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  int a = 1;
  int tint_symbol = a;
  int b = a;
  int tint_symbol_1 = tint_symbol;
  v.tint_symbol_2 = (((a + tint_symbol) + b) + tint_symbol_1);
}
