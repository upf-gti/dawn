@group(1) @binding(0) var arg_0 : texture_storage_2d_array<rgba8sint, read_write>;

fn textureStore_73a735() {
  textureStore(arg_0, vec2<u32>(1u), 1i, vec4<i32>(1i));
}

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureStore_73a735();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureStore_73a735();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureStore_73a735();
}
