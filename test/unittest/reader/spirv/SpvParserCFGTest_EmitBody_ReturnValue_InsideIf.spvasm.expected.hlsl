static uint var_1 = 0u;

uint x_200() {
  if (false) {
    return 2u;
  }
  return 3u;
}

void main_1() {
  const uint x_11 = x_200();
  return;
}

void main() {
  main_1();
  return;
}
