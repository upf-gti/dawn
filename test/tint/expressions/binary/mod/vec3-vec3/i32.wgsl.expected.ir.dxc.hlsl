
int3 tint_mod_v3i32(int3 lhs, int3 rhs) {
  int3 v = ((((rhs == (int(0)).xxx) | ((lhs == (int(-2147483648)).xxx) & (rhs == (int(-1)).xxx)))) ? ((int(1)).xxx) : (rhs));
  return (lhs - ((lhs / v) * v));
}

[numthreads(1, 1, 1)]
void f() {
  int3 a = int3(int(1), int(2), int(3));
  int3 b = int3(int(4), int(5), int(6));
  int3 r = tint_mod_v3i32(a, b);
}

