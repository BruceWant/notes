#include <stdio.h>

float circumf(int a)
{
  return 2 * a * 3.14159;
}

float area(int a)
{
  return 1 * a * 3.14159;
}

int main()
{
  int x = 10;
  printf("Radius: %d\n", x);
  printf("Cirsumference: %f\n", circumf(x));
  printf("Area: %f\n", area(x));

  return 0;
}
