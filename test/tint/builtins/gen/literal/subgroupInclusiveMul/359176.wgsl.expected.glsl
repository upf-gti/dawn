SKIP: FAILED


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<u32>;

fn subgroupInclusiveMul_359176() -> vec3<u32> {
  var res : vec3<u32> = subgroupInclusiveMul(vec3<u32>(1u));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupInclusiveMul_359176();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupInclusiveMul_359176();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupInclusiveMul/359176.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<u32>;

fn subgroupInclusiveMul_359176() -> vec3<u32> {
  var res : vec3<u32> = subgroupInclusiveMul(vec3<u32>(1u));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupInclusiveMul_359176();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupInclusiveMul_359176();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupInclusiveMul/359176.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


tint executable returned error: exit status 1
