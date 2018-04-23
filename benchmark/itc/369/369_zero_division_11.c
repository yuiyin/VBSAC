// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Basic type	int	The return value of the function
 */
int zero_division_013_func_001_bad ()
{
	return 0;
}

void zero_division_013_bad ()
{
	int dividend = 1000;
	int ret;
	ret = dividend / zero_division_013_func_001_bad();/*Tool should detect this line as error*/ /* ERROR:division by zero */
}

/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Basic type	int	The return value of the function
 */
int zero_division_013_func_001_good ()
{
	return 1;
}

void zero_division_013_good ()
{
	int dividend = 1000;
	int ret;
	ret = dividend / zero_division_013_func_001_good(); /*Tool should not detect this line as error*/ /* No ERROR:division by zero */
}

int main(){
  zero_division_013_good();
	zero_division_013_bad();
  return 0;
}
