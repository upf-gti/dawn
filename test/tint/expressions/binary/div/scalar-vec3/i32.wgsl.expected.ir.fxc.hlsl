
int3 tint_div_v3i32(int3 lhs, int3 rhs) {
  return (lhs / ((((rhs == (0).xxx) | ((lhs == (-2147483648).xxx) & (rhs == (-1).xxx)))) ? ((1).xxx) : (rhs)));
}

[numthreads(1, 1, 1)]
void f() {
  int a = 4;
  int3 b = int3(1, 2, 3);
  int3 r = tint_div_v3i32(int3((a).xxx), b);
}

