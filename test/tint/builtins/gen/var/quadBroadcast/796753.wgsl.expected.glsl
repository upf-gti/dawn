SKIP: INVALID


enable subgroups;
enable subgroups_f16;
enable f16;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<f16>;

fn quadBroadcast_796753() -> vec3<f16> {
  var arg_0 = vec3<f16>(1.0h);
  const arg_1 = 1i;
  var res : vec3<f16> = quadBroadcast(arg_0, arg_1);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = quadBroadcast_796753();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = quadBroadcast_796753();
}

Failed to generate: <dawn>/test/tint/builtins/gen/var/quadBroadcast/796753.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;
enable subgroups_f16;
enable f16;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<f16>;

fn quadBroadcast_796753() -> vec3<f16> {
  var arg_0 = vec3<f16>(1.0h);
  const arg_1 = 1i;
  var res : vec3<f16> = quadBroadcast(arg_0, arg_1);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = quadBroadcast_796753();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = quadBroadcast_796753();
}

Failed to generate: <dawn>/test/tint/builtins/gen/var/quadBroadcast/796753.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


tint executable returned error: exit status 1
