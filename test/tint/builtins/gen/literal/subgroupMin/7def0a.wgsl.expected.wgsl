enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : f32;

fn subgroupMin_7def0a() -> f32 {
  var res : f32 = subgroupMin(1.0f);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupMin_7def0a();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupMin_7def0a();
}
