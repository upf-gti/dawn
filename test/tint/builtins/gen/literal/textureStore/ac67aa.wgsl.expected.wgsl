@group(1) @binding(0) var arg_0 : texture_storage_3d<rg32uint, write>;

fn textureStore_ac67aa() {
  textureStore(arg_0, vec3<i32>(1i), vec4<u32>(1u));
}

@fragment
fn fragment_main() {
  textureStore_ac67aa();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureStore_ac67aa();
}
