
static float2 u = (1.0f).xx;
uint2 tint_v2f32_to_v2u32(float2 value) {
  return (((value <= (4294967040.0f).xx)) ? ((((value >= (0.0f).xx)) ? (uint2(value)) : ((0u).xx))) : ((4294967295u).xx));
}

void f() {
  uint2 v = tint_v2f32_to_v2u32(u);
}

[numthreads(1, 1, 1)]
void unused_entry_point() {
}

