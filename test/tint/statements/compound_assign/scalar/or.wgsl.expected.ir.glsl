#version 310 es

struct S {
  int a;
};

S v;
void foo() {
  v.a = (v.a | 2);
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
