SKIP: FAILED


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<u32>;

fn quadBroadcast_ae401e() -> vec3<u32> {
  var res : vec3<u32> = quadBroadcast(vec3<u32>(1u), 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = quadBroadcast_ae401e();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = quadBroadcast_ae401e();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/quadBroadcast/ae401e.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<u32>;

fn quadBroadcast_ae401e() -> vec3<u32> {
  var res : vec3<u32> = quadBroadcast(vec3<u32>(1u), 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = quadBroadcast_ae401e();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = quadBroadcast_ae401e();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/quadBroadcast/ae401e.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^

