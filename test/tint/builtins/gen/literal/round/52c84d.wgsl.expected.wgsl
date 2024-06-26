@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<f32>;

fn round_52c84d() -> vec2<f32> {
  var res : vec2<f32> = round(vec2<f32>(3.5f));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = round_52c84d();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = round_52c84d();
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
  out.prevent_dce = round_52c84d();
  return out;
}
