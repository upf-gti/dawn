SKIP: FAILED


@group(0) @binding(0) var<storage, read_write> prevent_dce : vec3<i32>;

fn subgroupMul_5a8c86() -> vec3<i32> {
  var arg_0 = vec3<i32>(1i);
  var res : vec3<i32> = subgroupMul(arg_0);
  return res;
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupMul_5a8c86();
}

Failed to generate: error: Unknown builtin method: 0x55ece80b8498
