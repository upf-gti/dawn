SKIP: FAILED


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : f32;

fn quadBroadcast_e6d39d() -> f32 {
  var arg_0 = 1.0f;
  const arg_1 = 1i;
  var res : f32 = quadBroadcast(arg_0, arg_1);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = quadBroadcast_e6d39d();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = quadBroadcast_e6d39d();
}

Failed to generate: <dawn>/test/tint/builtins/gen/var/quadBroadcast/e6d39d.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : f32;

fn quadBroadcast_e6d39d() -> f32 {
  var arg_0 = 1.0f;
  const arg_1 = 1i;
  var res : f32 = quadBroadcast(arg_0, arg_1);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = quadBroadcast_e6d39d();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = quadBroadcast_e6d39d();
}

Failed to generate: <dawn>/test/tint/builtins/gen/var/quadBroadcast/e6d39d.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^

