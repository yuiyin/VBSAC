// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Basic type	int	Function arguments
 */
void zero_division_014_func_001 (int divisor)
{
	int dividend = 1000;
	int ret;
	ret = dividend / divisor;/*Tool should detect this line as error*/ /* ERROR:division by zero */
}

void zero_division_014_bad ()
{
	zero_division_014_func_001(0);
}

void zero_division_014_good ()
{
	zero_division_014_func_001(1);
}

int main(){
	zero_division_014_good();
  zero_division_014_bad();
  return 0;
}
