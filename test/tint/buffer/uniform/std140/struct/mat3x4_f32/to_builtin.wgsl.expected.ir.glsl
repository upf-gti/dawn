#version 310 es


struct S {
  int before;
  mat3x4 m;
  int after;
};

layout(binding = 0, std140)
uniform tint_symbol_1_1_ubo {
  S tint_symbol[4];
} v;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  mat4x3 t = transpose(v.tint_symbol[2].m);
  float l = length(v.tint_symbol[0].m[1].ywxz);
  float a = abs(v.tint_symbol[0].m[1].ywxz[0u]);
}
