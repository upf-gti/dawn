static uint var_1 = 0u;

void main_1() {
  var_1 = 0u;
  while (true) {
    var_1 = 1u;
    var_1 = 2u;
    if (true) {
      var_1 = 3u;
      continue;
    }
    var_1 = 4u;
  }
  var_1 = 6u;
  return;
}

void main() {
  main_1();
  return;
}
