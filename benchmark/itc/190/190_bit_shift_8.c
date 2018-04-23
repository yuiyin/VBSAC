// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	Nonlinear equation
 */
void bit_shift_011_bad ()
{
	int a = 1;
	int shift = 5;
	int ret;
	ret = a << ((shift * shift) + 7);/*Tool should detect this line as error*/ /*ERROR:Bit shift error*/

}

/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	Nonlinear equation
 */
void bit_shift_011_good ()
{
	int a = 1;
	int shift = 2;
	int ret;
	ret = a << ((shift * shift) + 6);/*Tool should  Not detect this line as error*/ /*NO ERROR:Bit shift error*/

}

int main(){
  bit_shift_011_good();
	bit_shift_011_bad();
  return 0;
}
