SKIP: FAILED


@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<u32>;

fn subgroupExclusiveAdd_ec300f() -> vec4<u32> {
  var arg_0 = vec4<u32>(1u);
  var res : vec4<u32> = subgroupExclusiveAdd(arg_0);
  return res;
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupExclusiveAdd_ec300f();
}

Failed to generate: error: Unknown builtin method: 0x559ae072e498
