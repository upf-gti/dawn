
static int t = 0;
int4 m() {
  t = 1;
  return int4((t).xxxx);
}

void f() {
  float4 v = float4(m());
}

[numthreads(1, 1, 1)]
void unused_entry_point() {
}

