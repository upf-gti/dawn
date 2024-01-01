@group(1) @binding(0) var arg_0 : texture_storage_3d<rgba8snorm, read_write>;

fn textureLoad_1bc5ab() {
  var arg_1 = vec3<u32>(1u);
  var res : vec4<f32> = textureLoad(arg_0, arg_1);
  prevent_dce = res;
}

@group(2) @binding(0) var<storage, read_write> prevent_dce : vec4<f32>;

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureLoad_1bc5ab();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureLoad_1bc5ab();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureLoad_1bc5ab();
}
