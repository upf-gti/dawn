#version 310 es

void a(int a_2) {
  int a_1 = a_2;
  int b = a_1;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
}
