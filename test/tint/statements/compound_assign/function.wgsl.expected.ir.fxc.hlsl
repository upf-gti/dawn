
int tint_div_i32(int lhs, int rhs) {
  return (lhs / ((((rhs == 0) | ((lhs == -2147483648) & (rhs == -1)))) ? (1) : (rhs)));
}

void foo() {
  int a = 0;
  float4 b = (0.0f).xxxx;
  float2x2 c = float2x2((0.0f).xx, (0.0f).xx);
  a = tint_div_i32(a, 2);
  b = mul(float4x4((0.0f).xxxx, (0.0f).xxxx, (0.0f).xxxx, (0.0f).xxxx), b);
  c = (c * 2.0f);
}

[numthreads(1, 1, 1)]
void unused_entry_point() {
}

