SKIP: FAILED


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<i32>;

fn quadSwapX_edfa1f() -> vec4<i32> {
  var res : vec4<i32> = quadSwapX(vec4<i32>(1i));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = quadSwapX_edfa1f();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = quadSwapX_edfa1f();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/quadSwapX/edfa1f.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^


enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<i32>;

fn quadSwapX_edfa1f() -> vec4<i32> {
  var res : vec4<i32> = quadSwapX(vec4<i32>(1i));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = quadSwapX_edfa1f();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = quadSwapX_edfa1f();
}

Failed to generate: <dawn>/test/tint/builtins/gen/literal/quadSwapX/edfa1f.wgsl:41:8 error: GLSL backend does not support extension 'subgroups'
enable subgroups;
       ^^^^^^^^^

