#version 310 es

struct S1 {
  int i;
};

struct S2 {
  S1 s1;
};

struct S3 {
  S2 s2;
};

int f(S3 s3) {
  return s3.s2.s1.i;
}

layout(binding = 0, std430) buffer tint_symbol_block_ssbo {
  int inner;
} tint_symbol;

void tint_symbol_1() {
  S3 tint_symbol_2 = S3(S2(S1(42)));
  tint_symbol.inner = f(tint_symbol_2);
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  tint_symbol_1();
  return;
}
