enable subgroups;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<u32>;

fn subgroupMax_b8fb0e() -> vec2<u32> {
  var res : vec2<u32> = subgroupMax(vec2<u32>(1u));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupMax_b8fb0e();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupMax_b8fb0e();
}
