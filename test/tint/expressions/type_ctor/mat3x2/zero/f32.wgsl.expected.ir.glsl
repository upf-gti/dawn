#version 310 es

mat3x2 m = mat3x2(vec2(0.0f), vec2(0.0f), vec2(0.0f));
layout(binding = 0, std430)
buffer tint_symbol_2_1_ssbo {
  mat3x2 tint_symbol_1;
} v;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  v.tint_symbol_1 = m;
}
