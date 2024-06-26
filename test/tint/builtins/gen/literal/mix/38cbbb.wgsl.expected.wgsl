enable f16;

@group(0) @binding(0) var<storage, read_write> prevent_dce : f16;

fn mix_38cbbb() -> f16 {
  var res : f16 = mix(1.0h, 1.0h, 1.0h);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = mix_38cbbb();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = mix_38cbbb();
}

struct VertexOutput {
  @builtin(position)
  pos : vec4<f32>,
  @location(0) @interpolate(flat)
  prevent_dce : f16,
}

@vertex
fn vertex_main() -> VertexOutput {
  var out : VertexOutput;
  out.pos = vec4<f32>();
  out.prevent_dce = mix_38cbbb();
  return out;
}
