fn length_7b4741() {
  var res = length(vec2(0.0));
}

@fragment
fn fragment_main() {
  length_7b4741();
}

@compute @workgroup_size(1)
fn compute_main() {
  length_7b4741();
}

struct VertexOutput {
  @builtin(position)
  pos : vec4<f32>,
}

@vertex
fn vertex_main() -> VertexOutput {
  var out : VertexOutput;
  out.pos = vec4<f32>();
  length_7b4741();
  return out;
}
