#version 310 es

mat3 m = mat3(vec3(0.0f, 1.0f, 2.0f), vec3(3.0f, 4.0f, 5.0f), vec3(6.0f, 7.0f, 8.0f));
mat3 tint_symbol;
void tint_store_and_preserve_padding(inout mat3 target, mat3 value_param) {
  target[0u] = value_param[0u];
  target[1u] = value_param[1u];
  target[2u] = value_param[2u];
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  tint_store_and_preserve_padding(tint_symbol, m);
}
