SKIP: INVALID


static bool t = false;
bool m() {
  t = true;
  return bool(t);
}

void f() {
  float16_t v = float16_t(m());
}

[numthreads(1, 1, 1)]
void unused_entry_point() {
}

FXC validation failure:
<scrubbed_path>(9,3-11): error X3000: unrecognized identifier 'float16_t'
<scrubbed_path>(9,13): error X3000: unrecognized identifier 'v'


tint executable returned error: exit status 1
