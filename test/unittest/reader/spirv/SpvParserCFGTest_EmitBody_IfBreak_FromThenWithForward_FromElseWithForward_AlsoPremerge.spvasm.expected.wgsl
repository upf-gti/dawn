var<private> var_1 : u32;

fn main_1() {
  var_1 = 1u;
  var guard10 : bool = true;
  if (false) {
    var_1 = 2u;
    if (true) {
    } else {
      guard10 = false;
    }
    if (guard10) {
      var_1 = 3u;
    }
  } else {
    if (guard10) {
      var_1 = 4u;
      if (true) {
        guard10 = false;
      }
      if (guard10) {
        var_1 = 5u;
      }
    }
  }
  if (guard10) {
    var_1 = 6u;
    if (false) {
    } else {
      guard10 = false;
    }
    if (guard10) {
      var_1 = 7u;
      guard10 = false;
    }
  }
  var_1 = 8u;
  return;
}

[[stage(fragment)]]
fn main() {
  main_1();
}
