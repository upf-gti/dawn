#version 310 es

uint i;
void tint_symbol() {
  i = (i - 1u);
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
