// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Basic type	int	Variable
 */
void zero_division_009_bad ()
{
	int dividend = 1000;
	int divisor = 0;
	int ret;
	ret = dividend / divisor;/*Tool should detect this line as error*/ /* ERROR:division by zero */
}

/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Basic type	int	Variable
 */
void zero_division_009_good ()
{
	int dividend = 1000;
	int divisor = 1;
	int ret;
	ret = dividend / divisor; /*Tool should not detect this line as error*/ /* No ERROR:division by zero */
}

int main(){
  zero_division_009_good();
	zero_division_009_bad();
  return 0;
}
