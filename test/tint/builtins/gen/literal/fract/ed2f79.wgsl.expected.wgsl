fn fract_ed2f79() {
  var res = fract(vec3(1.25));
}

@fragment
fn fragment_main() {
  fract_ed2f79();
}

@compute @workgroup_size(1)
fn compute_main() {
  fract_ed2f79();
}

struct VertexOutput {
  @builtin(position)
  pos : vec4<f32>,
}

@vertex
fn vertex_main() -> VertexOutput {
  var out : VertexOutput;
  out.pos = vec4<f32>();
  fract_ed2f79();
  return out;
}
