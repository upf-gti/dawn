#version 310 es

uniform mat3x4 u;
mat3x4 s;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  mat3x4 x = u;
  s = x;
}
