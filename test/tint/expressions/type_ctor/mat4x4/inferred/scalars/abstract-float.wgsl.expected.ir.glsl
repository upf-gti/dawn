#version 310 es

layout(binding = 0, std430)
buffer tint_symbol_2_1_ssbo {
  mat4 tint_symbol_1;
} v;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  v.tint_symbol_1 = mat4(vec4(0.0f, 1.0f, 2.0f, 3.0f), vec4(4.0f, 5.0f, 6.0f, 7.0f), vec4(8.0f, 9.0f, 10.0f, 11.0f), vec4(12.0f, 13.0f, 14.0f, 15.0f));
}
