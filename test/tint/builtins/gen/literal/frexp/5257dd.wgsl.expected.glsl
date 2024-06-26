#version 310 es
#extension GL_AMD_gpu_shader_half_float : require
precision highp float;
precision highp int;

struct frexp_result_f16 {
  float16_t fract;
  int exp;
};


void frexp_5257dd() {
  frexp_result_f16 res = frexp_result_f16(0.5hf, 1);
}

struct VertexOutput {
  vec4 pos;
};

void fragment_main() {
  frexp_5257dd();
}

void main() {
  fragment_main();
  return;
}
#version 310 es
#extension GL_AMD_gpu_shader_half_float : require

struct frexp_result_f16 {
  float16_t fract;
  int exp;
};


void frexp_5257dd() {
  frexp_result_f16 res = frexp_result_f16(0.5hf, 1);
}

struct VertexOutput {
  vec4 pos;
};

void compute_main() {
  frexp_5257dd();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
#version 310 es
#extension GL_AMD_gpu_shader_half_float : require

struct frexp_result_f16 {
  float16_t fract;
  int exp;
};


void frexp_5257dd() {
  frexp_result_f16 res = frexp_result_f16(0.5hf, 1);
}

struct VertexOutput {
  vec4 pos;
};

VertexOutput vertex_main() {
  VertexOutput tint_symbol = VertexOutput(vec4(0.0f, 0.0f, 0.0f, 0.0f));
  tint_symbol.pos = vec4(0.0f);
  frexp_5257dd();
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
