#version 310 es

uniform uvec3 u;
uvec3 s;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  uvec3 x = u;
  s = x;
}
