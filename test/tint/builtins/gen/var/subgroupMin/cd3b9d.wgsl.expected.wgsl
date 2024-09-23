enable subgroups;
enable subgroups_f16;
enable f16;

@group(0) @binding(0) var<storage, read_write> prevent_dce : vec4<f16>;

fn subgroupMin_cd3b9d() -> vec4<f16> {
  var arg_0 = vec4<f16>(1.0h);
  var res : vec4<f16> = subgroupMin(arg_0);
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = subgroupMin_cd3b9d();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = subgroupMin_cd3b9d();
}
