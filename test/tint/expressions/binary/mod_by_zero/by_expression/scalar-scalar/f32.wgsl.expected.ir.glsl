#version 310 es

float tint_float_modulo(float x, float y) {
  return (x - (y * trunc((x / y))));
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  float a = 1.0f;
  float b = 0.0f;
  float r = tint_float_modulo(a, (b + b));
}
