#version 310 es

uniform ivec2 u;
ivec2 s;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  ivec2 x = u;
  s = x;
}
