#version 310 es


struct S {
  int before;
  uint tint_pad;
  uint tint_pad_1;
  uint tint_pad_2;
  mat3x4 m;
  int after;
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
  uint tint_pad_13;
  uint tint_pad_14;
  uint tint_pad_15;
  uint tint_pad_16;
  uint tint_pad_17;
};

layout(binding = 0, std140)
uniform tint_symbol_1_1_ubo {
  S tint_symbol[4];
} v_1;
void a(S a_1[4]) {
}
void b(S s) {
}
void c(mat3x4 m) {
}
void d(vec4 v) {
}
void e(float f) {
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  a(v_1.tint_symbol);
  b(v_1.tint_symbol[2]);
  c(v_1.tint_symbol[2].m);
  d(v_1.tint_symbol[0].m[1].ywxz);
  e(v_1.tint_symbol[0].m[1].ywxz[0u]);
}
