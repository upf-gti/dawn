var<private> var_1 : u32;

fn main_1() {
  loop {
    if (false) {
      var_1 = 1u;
      continue;
    }
    var_1 = 2u;

    continuing {
      var_1 = 3u;
    }
  }
  return;
}

[[stage(fragment)]]
fn main() {
  main_1();
}
