SKIP: FAILED


enable f16;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<f16>;

fn subgroupExclusiveAdd_95e984() -> vec4<f16> {
  var res : vec4<f16> = subgroupExclusiveAdd(vec4<f16>(1.0h));
  return res;
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupExclusiveAdd_95e984();
}

Failed to generate: error: Unknown builtin method: 0x55e4dbb39230
