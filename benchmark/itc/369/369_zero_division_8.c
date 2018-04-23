// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include <math.h>

int rand (void);

/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Basic type	int	Value of random variable
 */
void zero_division_010_bad ()
{
	int dividend = 1000;
	int divisor;
	int ret;
	divisor = rand();
	ret = dividend / divisor;/*Tool should detect this line as error*/ /* ERROR:division by zero */
}

/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Basic type	int	Value of random variable
 */
void zero_division_010_good ()
{
	int dividend = 1000;
	int divisor;
	int ret;
	divisor = rand();
	if (divisor != 0)
	{
		ret = dividend / divisor; /*Tool should not detect this line as error*/ /* No ERROR:division by zero */
	}
}


int main(){
  zero_division_010_good();
	zero_division_010_bad();
  return 0;
}
