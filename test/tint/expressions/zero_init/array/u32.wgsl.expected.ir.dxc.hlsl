SKIP: FAILED

void f() {
  uint[4] v = (uint[4])0;
}

[numthreads(1, 1, 1)]
void unused_entry_point() {
}

DXC validation failure:
hlsl.hlsl:2:12: error: brackets are not allowed here; to declare an array, place the brackets after the name
  uint[4] v = (uint[4])0;
      ~~~  ^
           [4]

