
float f() {
  float3 v = float3(1.0f, 2.0f, 3.0f);
  return v[int(1)];
}

[numthreads(1, 1, 1)]
void unused_entry_point() {
}

