@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<u32>;

fn reverseBits_35fea9() -> vec4<u32> {
  var res : vec4<u32> = reverseBits(vec4<u32>(1u));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = reverseBits_35fea9();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = reverseBits_35fea9();
}

struct VertexOutput {
  @builtin(position)
  pos : vec4<f32>,
  @location(0) @interpolate(flat)
  prevent_dce : vec4<u32>,
}

@vertex
fn vertex_main() -> VertexOutput {
  var out : VertexOutput;
  out.pos = vec4<f32>();
  out.prevent_dce = reverseBits_35fea9();
  return out;
}
