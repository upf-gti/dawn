enable subgroups;
enable subgroups_f16;
enable f16;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec2<f16>;

fn subgroupBroadcast_e4dd1a() -> vec2<f16> {
  var res : vec2<f16> = subgroupBroadcast(vec2<f16>(1.0h), 1i);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupBroadcast_e4dd1a();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupBroadcast_e4dd1a();
}
