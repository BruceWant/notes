#include <stdio.h>

int main()
{
  int b = 10;
  int c = b++;
  printf("c:%d, b:%d\n", c, b);
  return 0;
}

