fn log_655989() {
  var res = log(1.0);
}

@fragment
fn fragment_main() {
  log_655989();
}

@compute @workgroup_size(1)
fn compute_main() {
  log_655989();
}

struct VertexOutput {
  @builtin(position)
  pos : vec4<f32>,
}

@vertex
fn vertex_main() -> VertexOutput {
  var out : VertexOutput;
  out.pos = vec4<f32>();
  log_655989();
  return out;
}
