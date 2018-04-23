// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: divide by zero
 * Complexity: the remainder calculation (% =)	Basic type	int	Constant
 */
int zero_division_004_dividend_gbl = 1000;
static int zero_division_004_divisor_gbl_bad = 1;
void zero_division_004_func_001_bad ()
{
	zero_division_004_dividend_gbl %= zero_division_004_divisor_gbl_bad;/*Tool should detect this line as error*/ /* ERROR:division by zero */
}
void zero_division_004_bad ()
{

	zero_division_004_divisor_gbl_bad--;
	zero_division_004_func_001_bad ();

}

/*
 * Types of defects: divide by zero
 * Complexity: the remainder calculation (% =)	Basic type	int	Constant
 */
static int zero_division_004_divisor_gbl_good = 11;
void zero_division_004_func_001_good ()
{
	zero_division_004_dividend_gbl %= zero_division_004_divisor_gbl_good; /*Tool should not detect this line as error*/ /* No ERROR:division by zero */
}
void zero_division_004_good ()
{
	zero_division_004_divisor_gbl_good--;
	zero_division_004_func_001_good ();
}

int main(){
	zero_division_004_good();
  zero_division_004_bad();
  return 0;
}
