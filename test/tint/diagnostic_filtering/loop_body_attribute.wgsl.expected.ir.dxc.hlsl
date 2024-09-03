<dawn>/test/tint/diagnostic_filtering/loop_body_attribute.wgsl:4:9 warning: 'dpdx' must only be called from uniform control flow
    _ = dpdx(1.0);
        ^^^^^^^^^

<dawn>/test/tint/diagnostic_filtering/loop_body_attribute.wgsl:6:7 note: control flow depends on possibly non-uniform value
      break if x > 0.0;
      ^^^^^

<dawn>/test/tint/diagnostic_filtering/loop_body_attribute.wgsl:6:16 note: user-defined input 'x' of 'main' may be non-uniform
      break if x > 0.0;
               ^

struct main_inputs {
  float x : TEXCOORD0;
};


void main_inner(float x) {
  {
    while(true) {
      ddx(1.0f);
      {
        if ((x > 0.0f)) { break; }
      }
      continue;
    }
  }
}

void main(main_inputs inputs) {
  main_inner(inputs.x);
}

