enable subgroups;
enable subgroups_f16;
enable f16;

@group(0) @binding(0) var<storage, read_write> prevent_dce : f16;

fn subgroupMax_5611a5() -> f16 {
  var arg_0 = 1.0h;
  var res : f16 = subgroupMax(arg_0);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupMax_5611a5();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupMax_5611a5();
}
