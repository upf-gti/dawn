@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<f32>;

fn step_19accd() -> vec2<f32> {
  var res : vec2<f32> = step(vec2<f32>(1.0f), vec2<f32>(1.0f));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = step_19accd();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = step_19accd();
}

struct VertexOutput {
  @builtin(position)
  pos : vec4<f32>,
  @location(0) @interpolate(flat)
  prevent_dce : vec2<f32>,
}

@vertex
fn vertex_main() -> VertexOutput {
  var out : VertexOutput;
  out.pos = vec4<f32>();
  out.prevent_dce = step_19accd();
  return out;
}
