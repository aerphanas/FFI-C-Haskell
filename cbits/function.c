// Include the standard input/output library
#include <stdio.h>

// Define a function called "sayHello" that
// takes no arguments and returns nothing
void
sayHello( )
{
  // Print "hello world" to the console 
  // with printf function
  printf("hello from C program\n");
}

// Define a function called factorial that
// take one integer and return integer
int
factorial( int n )
{
  // if variable n equal 0 return 1
  // if not it will call myself 
  // that multiply n but with n - 1 as input
  return (n == 0) ? 1 : n * factorial(n - 1);
}
