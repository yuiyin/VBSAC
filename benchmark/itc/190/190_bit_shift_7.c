// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	Linear equation
 */
void bit_shift_010_bad ()
{
	int a = 1;
	int shift = 6;
	int ret;
	ret = a << ((5 * shift) + 2);/*Tool should detect this line as error*/ /*ERROR:Bit shift error*/

}

/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	Linear equation
 */
void bit_shift_010_good ()
{
	int a = 1;
	int shift = 2;
	int ret;
	ret = a << ((5 * shift) + 1);/*Tool should  Not detect this line as error*/ /*NO ERROR:Bit shift error*/

}

int main(){
  bit_shift_010_good();
	bit_shift_010_bad();
  return 0;
}
