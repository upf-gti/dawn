@group(1) @binding(0) var arg_0 : texture_storage_2d_array<rgba8snorm, read_write>;

fn textureStore_8ae0bc() {
  var arg_1 = vec2<i32>(1i);
  var arg_2 = 1u;
  var arg_3 = vec4<f32>(1.0f);
  textureStore(arg_0, arg_1, arg_2, arg_3);
}

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureStore_8ae0bc();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureStore_8ae0bc();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureStore_8ae0bc();
}
