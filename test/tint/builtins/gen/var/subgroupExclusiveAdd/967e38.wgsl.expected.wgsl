enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : f32;

fn subgroupExclusiveAdd_967e38() -> f32 {
  var arg_0 = 1.0f;
  var res : f32 = subgroupExclusiveAdd(arg_0);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupExclusiveAdd_967e38();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupExclusiveAdd_967e38();
}
