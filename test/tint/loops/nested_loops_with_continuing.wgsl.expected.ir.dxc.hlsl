
int f() {
  int i = 0;
  int j = 0;
  {
    while(true) {
      if ((i > 4)) {
        return 1;
      }
      {
        while(true) {
          if ((j > 4)) {
            return 2;
          }
          {
            j = (j + 1);
          }
          continue;
        }
      }
      /* unreachable */
    }
  }
  /* unreachable */
}

[numthreads(1, 1, 1)]
void unused_entry_point() {
}

