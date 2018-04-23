// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include <stdlib.h>

/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Basic type	int	 double alias
 */
int *zero_division_016_gbl_divisor_bad;

void zero_division_016_func_001_bad ()
{
	zero_division_016_gbl_divisor_bad = malloc(1*sizeof(int));
	*zero_division_016_gbl_divisor_bad = -1;
}

void zero_division_016_func_002_bad ()
{
	(*zero_division_016_gbl_divisor_bad)++;
}

void zero_division_016_bad ()
{
	int dividend = 1000;
	int divisor1;
	int divisor2;
	int ret;
	zero_division_016_func_001_bad ();
	zero_division_016_func_002_bad ();
	divisor1 = *zero_division_016_gbl_divisor_bad;
	divisor2 = divisor1;
	ret = dividend / divisor2;/*Tool should detect this line as error*/ /* ERROR:division by zero */
}

/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Basic type	int	Also known as double Alias
 */
int *zero_division_016_gbl_divisor_good;

void zero_division_016_func_001_good ()
{
	zero_division_016_gbl_divisor_good = malloc(1*sizeof(int));
	*zero_division_016_gbl_divisor_good= 1;
}

void zero_division_016_func_002_good ()
{
	(*zero_division_016_gbl_divisor_good)++;
}

void zero_division_016_good ()
{
	int dividend = 1000;
	int divisor1;
	int divisor2;
	int ret;
	zero_division_016_func_001_good ();
	zero_division_016_func_002_good ();
	divisor1 = *zero_division_016_gbl_divisor_good;
	divisor2 = divisor1;
	ret = dividend / divisor2; /*Tool should not detect this line as error*/ /* No ERROR:division by zero */
}

int main(){
  zero_division_016_good();
	zero_division_016_bad();
  return 0;
}
