fn main_1() {
  let x_1 : vec2<i32> = (vec2<i32>(40, 30) >> bitcast<vec2<u32>>(vec2<i32>(30, 40)));
  return;
}

[[stage(fragment)]]
fn main() {
  main_1();
}
