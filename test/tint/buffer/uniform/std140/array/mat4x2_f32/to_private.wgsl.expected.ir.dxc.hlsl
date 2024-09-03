
cbuffer cbuffer_u : register(b0) {
  uint4 u[8];
};
RWByteAddressBuffer s : register(u1);
static float4x2 p[4] = (float4x2[4])0;
float4x2 v(uint start_byte_offset) {
  uint4 v_1 = u[(start_byte_offset / 16u)];
  float2 v_2 = asfloat((((((start_byte_offset % 16u) / 4u) == 2u)) ? (v_1.zw) : (v_1.xy)));
  uint4 v_3 = u[((8u + start_byte_offset) / 16u)];
  float2 v_4 = asfloat(((((((8u + start_byte_offset) % 16u) / 4u) == 2u)) ? (v_3.zw) : (v_3.xy)));
  uint4 v_5 = u[((16u + start_byte_offset) / 16u)];
  float2 v_6 = asfloat(((((((16u + start_byte_offset) % 16u) / 4u) == 2u)) ? (v_5.zw) : (v_5.xy)));
  uint4 v_7 = u[((24u + start_byte_offset) / 16u)];
  return float4x2(v_2, v_4, v_6, asfloat(((((((24u + start_byte_offset) % 16u) / 4u) == 2u)) ? (v_7.zw) : (v_7.xy))));
}

typedef float4x2 ary_ret[4];
ary_ret v_8(uint start_byte_offset) {
  float4x2 a[4] = (float4x2[4])0;
  {
    uint v_9 = 0u;
    v_9 = 0u;
    while(true) {
      uint v_10 = v_9;
      if ((v_10 >= 4u)) {
        break;
      }
      a[v_10] = v((start_byte_offset + (v_10 * 32u)));
      {
        v_9 = (v_10 + 1u);
      }
      continue;
    }
  }
  float4x2 v_11[4] = a;
  return v_11;
}

[numthreads(1, 1, 1)]
void f() {
  float4x2 v_12[4] = v_8(0u);
  p = v_12;
  p[1] = v(64u);
  p[1][0] = asfloat(u[0u].zw).yx;
  p[1][0][0u] = asfloat(u[0u].z);
  s.Store(0u, asuint(p[1][0].x));
}

