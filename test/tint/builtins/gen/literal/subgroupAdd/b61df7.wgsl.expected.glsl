SKIP: INVALID


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : u32;

fn subgroupAdd_b61df7() -> u32 {
  var res : u32 = subgroupAdd(1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupAdd_b61df7();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupAdd_b61df7();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupAdd/b61df7.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : u32;

fn subgroupAdd_b61df7() -> u32 {
  var res : u32 = subgroupAdd(1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupAdd_b61df7();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupAdd_b61df7();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupAdd/b61df7.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


tint executable returned error: exit status 1
