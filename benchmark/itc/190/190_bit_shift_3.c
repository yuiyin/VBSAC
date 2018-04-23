// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: BitShift errors
 * Complexity: int	Shift left on negative values	Constant
 */
void bit_shift_005_bad ()
{
	int a = 1;
	int ret;
	ret = a << -1;/*Tool should detect this line as error*/ /*ERROR:Bit shift error*/

}

/*
 * Types of defects: BitShift errors
 * Complexity: int	Shift left on negative values	Constant
 */
void bit_shift_005_good ()
{
	int a = 1;
	int ret;
	ret = a << 10;/*Tool should  Not detect this line as error*/ /*NO ERROR:Bit shift error*/

}

int main(){
  bit_shift_005_good();
	bit_shift_005_bad();
  return 0;
}
