SKIP: FAILED


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<u32>;

fn subgroupShuffle_5ef5a2() -> vec2<u32> {
  var arg_0 = vec2<u32>(1u);
  var arg_1 = 1u;
  var res : vec2<u32> = subgroupShuffle(arg_0, arg_1);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupShuffle_5ef5a2();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupShuffle_5ef5a2();
}

Failed to generate: <dawn>/test/tint/builtins/gen/var/subgroupShuffle/5ef5a2.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<u32>;

fn subgroupShuffle_5ef5a2() -> vec2<u32> {
  var arg_0 = vec2<u32>(1u);
  var arg_1 = 1u;
  var res : vec2<u32> = subgroupShuffle(arg_0, arg_1);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupShuffle_5ef5a2();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupShuffle_5ef5a2();
}

Failed to generate: <dawn>/test/tint/builtins/gen/var/subgroupShuffle/5ef5a2.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^

