@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<f32>;

@group(1) @binding(0) var arg_0 : texture_3d<f32>;

@group(1) @binding(1) var arg_1 : sampler;

fn textureSampleBias_594824() -> vec4<f32> {
  var res : vec4<f32> = textureSampleBias(arg_0, arg_1, vec3<f32>(1.0f), 1.0f, vec3<i32>(1i));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = textureSampleBias_594824();
}
