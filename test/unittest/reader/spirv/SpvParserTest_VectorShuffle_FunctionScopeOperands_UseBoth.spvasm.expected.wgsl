struct S {
  field0 : vec2<f32>;
  field1 : u32;
  field2 : i32;
};

fn main_1() {
  let x_1 : vec2<u32> = vec2<u32>(3u, 4u);
  let x_2 : vec2<u32> = (vec2<u32>(4u, 3u) + vec2<u32>(3u, 4u));
  let x_10 : vec4<u32> = vec4<u32>(x_2.y, x_2.x, x_1.y, x_1.x);
  return;
}

[[stage(compute), workgroup_size(1, 1, 1)]]
fn main() {
  main_1();
}
