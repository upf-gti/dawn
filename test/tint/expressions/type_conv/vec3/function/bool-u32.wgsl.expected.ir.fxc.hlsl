
static bool t = false;
bool3 m() {
  t = true;
  return bool3((t).xxx);
}

void f() {
  uint3 v = uint3(m());
}

[numthreads(1, 1, 1)]
void unused_entry_point() {
}

