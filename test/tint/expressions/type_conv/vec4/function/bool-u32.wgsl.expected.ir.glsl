#version 310 es

bool t = false;
bvec4 m() {
  t = true;
  return bvec4(t);
}
void f() {
  uvec4 v = uvec4(m());
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
