#version 310 es
#extension GL_AMD_gpu_shader_half_float: require

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  float16_t a = 1.0hf;
  float16_t b = 0.0hf;
  float16_t r = (a / (b + b));
}
