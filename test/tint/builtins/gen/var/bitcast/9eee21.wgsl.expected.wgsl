fn bitcast_9eee21() {
  var arg_0 = vec3<i32>(1i);
  var res : vec3<i32> = bitcast<vec3<i32>>(arg_0);
  prevent_dce = res;
}

@group(2) @binding(0) var<storage, read_write> prevent_dce : vec3<i32>;

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  bitcast_9eee21();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  bitcast_9eee21();
}

@compute @workgroup_size(1)
fn compute_main() {
  bitcast_9eee21();
}
