SKIP: FAILED


@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<u32>;

fn subgroupMul_dc672a() -> vec2<u32> {
  var res : vec2<u32> = subgroupMul(vec2<u32>(1u));
  return res;
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupMul_dc672a();
}

Failed to generate: error: Unknown builtin method: 0x5598fc2f7230
