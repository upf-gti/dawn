var<private> var_1 : u32;

fn main_1() {
  loop {
    if (false) {
      break;
    } else {
      break;
    }
  }
  return;
}

[[stage(fragment)]]
fn main() {
  main_1();
}
