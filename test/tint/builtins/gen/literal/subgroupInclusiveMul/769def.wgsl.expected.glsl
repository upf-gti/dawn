SKIP: FAILED


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<i32>;

fn subgroupInclusiveMul_769def() -> vec3<i32> {
  var res : vec3<i32> = subgroupInclusiveMul(vec3<i32>(1i));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupInclusiveMul_769def();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupInclusiveMul_769def();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupInclusiveMul/769def.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<i32>;

fn subgroupInclusiveMul_769def() -> vec3<i32> {
  var res : vec3<i32> = subgroupInclusiveMul(vec3<i32>(1i));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupInclusiveMul_769def();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupInclusiveMul_769def();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupInclusiveMul/769def.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


tint executable returned error: exit status 1
