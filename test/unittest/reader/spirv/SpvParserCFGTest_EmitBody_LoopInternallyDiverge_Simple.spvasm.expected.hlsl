static uint var_1 = 0u;

void main_1() {
  var_1 = 10u;
  while (true) {
    var_1 = 20u;
    if (false) {
      var_1 = 30u;
      {
        var_1 = 90u;
      }
      continue;
    } else {
      var_1 = 40u;
    }
    {
      var_1 = 90u;
    }
  }
  var_1 = 99u;
  return;
}

void main() {
  main_1();
  return;
}
