// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	1 Heavy pointer	int	Variable
 */
int zero_division_006_gbl_divisor_bad = 0;
void zero_division_006_bad ()
{
	int dividend = 1000;

	int *p;
	int ret;
	p = &zero_division_006_gbl_divisor_bad;
	ret = dividend / *p;/*Tool should detect this line as error*/ /* ERROR:division by zero */
}

/*
 * Types of defects: divide by zero
 * Complexity: divide (/)	1 Heavy pointer	int	Variable
 */
int zero_division_006_gbl_divisor_good = 1;

void zero_division_006_good ()
{
	int dividend = 1000;

	int *p;
	int ret;
	p = &zero_division_006_gbl_divisor_good;
	ret = dividend / *p; /*Tool should not detect this line as error*/ /* No ERROR:division by zero */
}

int main(){
	zero_division_006_good();
  zero_division_006_bad();
  return 0;
}
