
Texture3D<float4> t_f : register(t0);
Texture3D<int4> t_i : register(t1);
Texture3D<uint4> t_u : register(t2);
[numthreads(1, 1, 1)]
void main() {
  Texture3D<float4> v = t_f;
  uint4 v_1 = (0u).xxxx;
  v.GetDimensions(uint(int(1)), v_1[0u], v_1[1u], v_1[2u], v_1[3u]);
  uint3 fdims = v_1.xyz;
  Texture3D<int4> v_2 = t_i;
  uint4 v_3 = (0u).xxxx;
  v_2.GetDimensions(uint(int(1)), v_3[0u], v_3[1u], v_3[2u], v_3[3u]);
  uint3 idims = v_3.xyz;
  Texture3D<uint4> v_4 = t_u;
  uint4 v_5 = (0u).xxxx;
  v_4.GetDimensions(uint(int(1)), v_5[0u], v_5[1u], v_5[2u], v_5[3u]);
  uint3 udims = v_5.xyz;
}

