#version 310 es

int tint_div_i32(int lhs, int rhs) {
  uint v = uint((lhs == (-2147483647 - 1)));
  bool v_1 = bool((v & uint((rhs == -1))));
  uint v_2 = uint((rhs == 0));
  return (lhs / ((bool((v_2 | uint(v_1)))) ? (1) : (rhs)));
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  int a = 1;
  int b = 0;
  int c = tint_div_i32(a, b);
}
