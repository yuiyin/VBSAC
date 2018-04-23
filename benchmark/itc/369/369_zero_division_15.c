// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include <math.h>
#include <stdlib.h>
int rand (void);

/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	1-Dimensional array	int	An array of element values
 */
void zero_division_005_bad ()
{
	int dividend = 1000;
	int divisors[5] = {2, 1, 0, 3, 4};
	int ret;
	ret = dividend / divisors[2];/*Tool should detect this line as error*/ /* ERROR:division by zero */
}

/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	1-Dimensional array	int	An array of element values
 */
void zero_division_005_good ()
{
	int dividend = 1000;
	int divisors[5] = {2, 1, 3, 0, 4};
	int ret;
	ret = dividend / divisors[2]; /*Tool should not detect this line as error*/ /* No ERROR:division by zero */
}

int main(){
	zero_division_005_good();
  zero_division_005_bad();
  return 0;
}
