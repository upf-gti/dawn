#version 310 es

float a = 1.0f;
float b = 0.0f;
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  float x = (a + b);
}
