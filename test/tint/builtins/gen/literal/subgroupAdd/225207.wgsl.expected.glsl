SKIP: INVALID


enable subgroups;
enable subgroups_f16;
enable f16;

@group(0) @binding(0) var<storage, read_write> prevent_dce : f16;

fn subgroupAdd_225207() -> f16 {
  var res : f16 = subgroupAdd(1.0h);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupAdd_225207();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupAdd_225207();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupAdd/225207.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;
enable subgroups_f16;
enable f16;

@group(0) @binding(0) var<storage, read_write> prevent_dce : f16;

fn subgroupAdd_225207() -> f16 {
  var res : f16 = subgroupAdd(1.0h);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupAdd_225207();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupAdd_225207();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupAdd/225207.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


tint executable returned error: exit status 1
