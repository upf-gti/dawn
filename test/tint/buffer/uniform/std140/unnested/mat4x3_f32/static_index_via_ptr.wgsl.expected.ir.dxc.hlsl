
cbuffer cbuffer_m : register(b0) {
  uint4 m[4];
};
static int counter = 0;
int i() {
  counter = (counter + 1);
  return counter;
}

float4x3 v(uint start_byte_offset) {
  float3 v_1 = asfloat(m[(start_byte_offset / 16u)].xyz);
  float3 v_2 = asfloat(m[((16u + start_byte_offset) / 16u)].xyz);
  float3 v_3 = asfloat(m[((32u + start_byte_offset) / 16u)].xyz);
  return float4x3(v_1, v_2, v_3, asfloat(m[((48u + start_byte_offset) / 16u)].xyz));
}

[numthreads(1, 1, 1)]
void f() {
  float4x3 l_m = v(0u);
  float3 l_m_1 = asfloat(m[1u].xyz);
}

