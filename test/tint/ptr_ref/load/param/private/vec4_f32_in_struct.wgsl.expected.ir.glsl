#version 310 es

struct str {
  vec4 i;
};

str P = str(vec4(0.0f));
vec4 func(inout vec4 pointer) {
  return pointer;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  vec4 r = func(P.i);
}
