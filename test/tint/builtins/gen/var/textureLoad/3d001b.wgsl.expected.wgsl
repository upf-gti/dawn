@group(1) @binding(0) var arg_0 : texture_storage_3d<rgba8sint, read>;

fn textureLoad_3d001b() {
  var arg_1 = vec3<i32>(1i);
  var res : vec4<i32> = textureLoad(arg_0, arg_1);
  prevent_dce = res;
}

@group(2) @binding(0) var<storage, read_write> prevent_dce : vec4<i32>;

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureLoad_3d001b();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureLoad_3d001b();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureLoad_3d001b();
}
