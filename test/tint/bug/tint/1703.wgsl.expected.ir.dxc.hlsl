
static float4 my_global = (0.0f).xxxx;
cbuffer cbuffer_my_uniform : register(b0) {
  uint4 my_uniform[1];
};
Texture2D<float4> my_texture : register(t1);
SamplerState my_sampler : register(s2);
void foo_member_initialize() {
  bool2 vb2 = (false).xx;
  vb2[0u] = (my_global.z != 0.0f);
  vb2[0u] = (asfloat(my_uniform[0u].x) == -1.0f);
  vb2 = bool2((asfloat(my_uniform[0u].x) == -1.0f), false);
  if (vb2.x) {
    float4 r = my_texture.SampleBias(my_sampler, (0.0f).xx, 0.0f);
  }
}

void foo_default_initialize() {
  bool2 vb2 = (false).xx;
  vb2[0u] = (my_global.z != 0.0f);
  vb2[0u] = (asfloat(my_uniform[0u].x) == -1.0f);
  vb2 = (false).xx;
  if (vb2.x) {
    float4 r = my_texture.SampleBias(my_sampler, (0.0f).xx, 0.0f);
  }
}

[numthreads(1, 1, 1)]
void unused_entry_point() {
}

