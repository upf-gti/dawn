#version 310 es

void f() {
  mat4x2 v = mat4x2(vec2(0.0f), vec2(0.0f), vec2(0.0f), vec2(0.0f));
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
