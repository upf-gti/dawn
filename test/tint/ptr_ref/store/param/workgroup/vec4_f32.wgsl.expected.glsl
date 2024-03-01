#version 310 es

shared vec4 S;
void tint_zero_workgroup_memory(uint local_idx) {
  if ((local_idx < 1u)) {
    S = vec4(0.0f);
  }
  barrier();
}

void func_S() {
  S = vec4(0.0f);
}

void tint_symbol(uint local_invocation_index) {
  tint_zero_workgroup_memory(local_invocation_index);
  func_S();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  tint_symbol(gl_LocalInvocationIndex);
  return;
}
