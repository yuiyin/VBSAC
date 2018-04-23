// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	Structure of the	int	Variable
 */
typedef struct {
	int a;
	int b;
	int divisor;
} zero_division_007_s_001;

zero_division_007_s_001 zero_division_007_s_gbl_bad;

void zero_division_007_func_001_bad ()
{
	zero_division_007_s_gbl_bad.divisor = 0;
}

void zero_division_007_bad ()
{
	int dividend = 1000;
	int ret;
	zero_division_007_func_001_bad();
	ret = dividend / zero_division_007_s_gbl_bad.divisor;/*Tool should detect this line as error*/ /* ERROR:division by zero */
}

zero_division_007_s_001 zero_division_007_s_gbl_good;

void zero_division_007_func_001_good ()
{
	zero_division_007_s_gbl_good.divisor = 1;
}

void zero_division_007_good ()
{
	int dividend = 1000;
	int ret;
	zero_division_007_func_001_good();
	ret = dividend / zero_division_007_s_gbl_good.divisor; /*Tool should not detect this line as error*/ /* No ERROR:division by zero */
}

int main(){
	zero_division_007_good();
  zero_division_007_bad();
  return 0;
}
