var<private> x_2 : vec4<f32>;

var<private> x_900 : f32;

fn main_1() {
  x_900 = 1.0;
  return;
}

struct main_out {
  [[builtin(position)]]
  x_2_1 : vec4<f32>;
};

[[stage(vertex)]]
fn main() -> main_out {
  main_1();
  return main_out(x_2);
}
