SKIP: FAILED


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<u32>;

fn subgroupOr_663a21() -> vec3<u32> {
  var res : vec3<u32> = subgroupOr(vec3<u32>(1u));
  return res;
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupOr_663a21();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/subgroupOr/663a21.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^

