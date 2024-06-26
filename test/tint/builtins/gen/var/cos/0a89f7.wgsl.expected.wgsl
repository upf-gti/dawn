enable f16;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<f16>;

fn cos_0a89f7() -> vec4<f16> {
  var arg_0 = vec4<f16>(0.0h);
  var res : vec4<f16> = cos(arg_0);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = cos_0a89f7();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = cos_0a89f7();
}

struct VertexOutput {
  @builtin(position)
  pos : vec4<f32>,
  @location(0) @interpolate(flat)
  prevent_dce : vec4<f16>,
}

@vertex
fn vertex_main() -> VertexOutput {
  var out : VertexOutput;
  out.pos = vec4<f32>();
  out.prevent_dce = cos_0a89f7();
  return out;
}
