@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<f32>;

fn sqrt_aa0d7a() -> vec4<f32> {
  var res : vec4<f32> = sqrt(vec4<f32>(1.0f));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = sqrt_aa0d7a();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = sqrt_aa0d7a();
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
  out.prevent_dce = sqrt_aa0d7a();
  return out;
}
