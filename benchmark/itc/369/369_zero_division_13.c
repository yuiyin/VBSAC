// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Basic type	int	single Alias
 */
void zero_division_015_bad ()
{
	int dividend = 1000;
	int divisor = 0;
	int divisor1;
	int ret;
	divisor1 = divisor;
	ret = dividend / divisor1;/*Tool should detect this line as error*/ /* ERROR:division by zero */
}

/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Basic type	int	Alias for 1 weight
 */
void zero_division_015_good ()
{
	int dividend = 1000;
	int divisor = 1;
	int divisor1;
	int ret;
	divisor1 = divisor;
	ret = dividend / divisor1; /*Tool should not detect this line as error*/ /* No ERROR:division by zero */
}

int main(){
	zero_division_015_good();
  zero_division_015_bad();
  return 0;
}
