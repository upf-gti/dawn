#version 310 es
precision highp float;
precision highp int;

void degrees_fafa7e() {
  float res = 57.295780181884765625f;
}

struct VertexOutput {
  vec4 pos;
};

void fragment_main() {
  degrees_fafa7e();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

void degrees_fafa7e() {
  float res = 57.295780181884765625f;
}

struct VertexOutput {
  vec4 pos;
};

void compute_main() {
  degrees_fafa7e();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
#version 310 es

void degrees_fafa7e() {
  float res = 57.295780181884765625f;
}

struct VertexOutput {
  vec4 pos;
};

VertexOutput vertex_main() {
  VertexOutput tint_symbol = VertexOutput(vec4(0.0f, 0.0f, 0.0f, 0.0f));
  tint_symbol.pos = vec4(0.0f);
  degrees_fafa7e();
  return tint_symbol;
}

void main() {
  gl_PointSize = 1.0;
  VertexOutput inner_result = vertex_main();
  gl_Position = inner_result.pos;
  gl_Position.y = -(gl_Position.y);
  gl_Position.z = ((2.0f * gl_Position.z) - gl_Position.w);
  return;
}
