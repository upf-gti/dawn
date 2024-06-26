@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<f32>;

fn round_106c0b() -> vec4<f32> {
  var res : vec4<f32> = round(vec4<f32>(3.5f));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = round_106c0b();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = round_106c0b();
}

struct VertexOutput {
  @builtin(position)
  pos : vec4<f32>,
  @location(0) @interpolate(flat)
  prevent_dce : vec4<f32>,
}

@vertex
fn vertex_main() -> VertexOutput {
  var out : VertexOutput;
  out.pos = vec4<f32>();
  out.prevent_dce = round_106c0b();
  return out;
}
