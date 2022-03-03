#include <stdio.h>

int addMe(int a, int b);

int main(void) {
  int result = addMe(2, 3);

  printf("The result of the addMe functino is %d!\n", result);

  return 0;
}

int addMe(int a, int b) {
  return a + b;
}
