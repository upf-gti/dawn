#version 310 es
#extension GL_AMD_gpu_shader_half_float: require


struct S_std140 {
  int before;
  f16vec2 m_col0;
  f16vec2 m_col1;
  uint tint_pad;
  uint tint_pad_1;
  uint tint_pad_2;
  uint tint_pad_3;
  uint tint_pad_4;
  uint tint_pad_5;
  uint tint_pad_6;
  uint tint_pad_7;
  uint tint_pad_8;
  uint tint_pad_9;
  uint tint_pad_10;
  uint tint_pad_11;
  uint tint_pad_12;
  int after;
  uint tint_pad_13;
  uint tint_pad_14;
  uint tint_pad_15;
  uint tint_pad_16;
  uint tint_pad_17;
  uint tint_pad_18;
  uint tint_pad_19;
  uint tint_pad_20;
  uint tint_pad_21;
  uint tint_pad_22;
  uint tint_pad_23;
  uint tint_pad_24;
  uint tint_pad_25;
  uint tint_pad_26;
  uint tint_pad_27;
};

layout(binding = 0, std140)
uniform tint_symbol_1_std140_1_ubo {
  S_std140 tint_symbol[4];
} v;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  f16mat2 t = transpose(f16mat2(v.tint_symbol[2].m_col0, v.tint_symbol[2].m_col1));
  float16_t l = length(v.tint_symbol[0].m_col1.yx);
  float16_t a = abs(v.tint_symbol[0].m_col1.yx[0u]);
}
