SKIP: FAILED


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : f32;

fn subgroupShuffleUp_23c7ca() -> f32 {
  var res : f32 = subgroupShuffleUp(1.0f, 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupShuffleUp_23c7ca();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupShuffleUp_23c7ca();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupShuffleUp/23c7ca.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : f32;

fn subgroupShuffleUp_23c7ca() -> f32 {
  var res : f32 = subgroupShuffleUp(1.0f, 1u);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupShuffleUp_23c7ca();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupShuffleUp_23c7ca();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupShuffleUp/23c7ca.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^

