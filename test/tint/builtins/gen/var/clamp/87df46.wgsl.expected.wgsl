fn clamp_87df46() {
  const arg_0 = vec4(1.0);
  const arg_1 = vec4(1.0);
  const arg_2 = vec4(1.0);
  var res = clamp(arg_0, arg_1, arg_2);
}

@fragment
fn fragment_main() {
  clamp_87df46();
}

@compute @workgroup_size(1)
fn compute_main() {
  clamp_87df46();
}

struct VertexOutput {
  @builtin(position)
  pos : vec4<f32>,
}

@vertex
fn vertex_main() -> VertexOutput {
  var out : VertexOutput;
  out.pos = vec4<f32>();
  clamp_87df46();
  return out;
}
