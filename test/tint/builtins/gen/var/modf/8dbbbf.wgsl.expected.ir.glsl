#version 310 es
#extension GL_AMD_gpu_shader_half_float: require
precision highp float;
precision highp int;


struct modf_result_f16 {
  float16_t fract;
  float16_t whole;
};

void modf_8dbbbf() {
  float16_t arg_0 = -1.5hf;
  modf_result_f16 v = modf_result_f16(0.0hf, 0.0hf);
  v.fract = modf(arg_0, v.whole);
  modf_result_f16 res = v;
}
void main() {
  modf_8dbbbf();
}
#version 310 es
#extension GL_AMD_gpu_shader_half_float: require


struct modf_result_f16 {
  float16_t fract;
  float16_t whole;
};

void modf_8dbbbf() {
  float16_t arg_0 = -1.5hf;
  modf_result_f16 v = modf_result_f16(0.0hf, 0.0hf);
  v.fract = modf(arg_0, v.whole);
  modf_result_f16 res = v;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  modf_8dbbbf();
}
#version 310 es
#extension GL_AMD_gpu_shader_half_float: require


struct modf_result_f16 {
  float16_t fract;
  float16_t whole;
};

struct VertexOutput {
  vec4 pos;
};

void modf_8dbbbf() {
  float16_t arg_0 = -1.5hf;
  modf_result_f16 v = modf_result_f16(0.0hf, 0.0hf);
  v.fract = modf(arg_0, v.whole);
  modf_result_f16 res = v;
}
VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = VertexOutput(vec4(0.0f));
  tint_symbol.pos = vec4(0.0f);
  modf_8dbbbf();
  return tint_symbol;
}
void main() {
  gl_Position = vertex_main_inner().pos;
  gl_Position[1u] = -(gl_Position.y);
  gl_Position[2u] = ((2.0f * gl_Position.z) - gl_Position.w);
  gl_PointSize = 1.0f;
}
