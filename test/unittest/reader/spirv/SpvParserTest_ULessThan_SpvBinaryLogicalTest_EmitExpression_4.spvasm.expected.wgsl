fn main_1() {
  let x_1 : vec2<bool> = (bitcast<vec2<u32>>(vec2<i32>(30, 40)) < vec2<u32>(20u, 10u));
  return;
}

[[stage(fragment)]]
fn main() {
  main_1();
}
