SKIP: INVALID


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : u32;

fn subgroupInclusiveMul_89437b() -> u32 {
  var res : u32 = subgroupInclusiveMul(1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupInclusiveMul_89437b();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupInclusiveMul_89437b();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupInclusiveMul/89437b.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : u32;

fn subgroupInclusiveMul_89437b() -> u32 {
  var res : u32 = subgroupInclusiveMul(1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupInclusiveMul_89437b();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupInclusiveMul_89437b();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupInclusiveMul/89437b.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


tint executable returned error: exit status 1
