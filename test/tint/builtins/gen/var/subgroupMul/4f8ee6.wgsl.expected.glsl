SKIP: FAILED


@group(0) @binding(0) var<storage, read_write> prevent_dce : u32;

fn subgroupMul_4f8ee6() -> u32 {
  var arg_0 = 1u;
  var res : u32 = subgroupMul(arg_0);
  return res;
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupMul_4f8ee6();
}

Failed to generate: error: Unknown builtin method: 0x563a0811d1c0
