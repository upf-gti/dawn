#version 310 es

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  float a = 2.003662109375f;
  int b = floatBitsToInt(a);
}
