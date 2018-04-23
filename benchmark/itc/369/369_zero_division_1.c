// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Basic type	int	Constant
 */
void zero_division_001_bad ()
{
	int dividend = 1000;
	int ret;
	ret = dividend / 0;/*Tool should detect this line as error*/ /* ERROR:division by zero */
}

/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Basic type	int	Constant
 */
void zero_division_001_good ()
{
	int dividend = 1000;
	int ret;
	ret = dividend / 1; /*Tool should not detect this line as error*/ /* No ERROR:division by zero */
}

int main(){
  zero_division_001_good();
	zero_division_001_bad();
  return 0;
}
