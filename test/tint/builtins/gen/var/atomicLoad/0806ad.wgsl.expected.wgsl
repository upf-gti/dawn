@group(0) @binding(0) var<storage, read_write> prevent_dce : i32;

struct SB_RW {
  arg_0 : atomic<i32>,
}

@group(0) @binding(1) var<storage, read_write> sb_rw : SB_RW;

fn atomicLoad_0806ad() -> i32 {
  var res : i32 = atomicLoad(&(sb_rw.arg_0));
  return res;
}

@fragment
fn fragment_main() {
  prevent_dce = atomicLoad_0806ad();
}

@compute @workgroup_size(1)
fn compute_main() {
  prevent_dce = atomicLoad_0806ad();
}
