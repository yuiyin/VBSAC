// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: BitShift errors
 * Complexity: unsigned int	Beyond the size of the left shift -Constant
 */
void bit_shift_003_bad ()
{
	unsigned int a = 1;
	unsigned int ret;
	ret = a << 32;/*Tool should detect this line as error*/ /*ERROR:Bit shift error*/

}

/*
 * Types of defects: BitShift errors
 * Complexity: unsigned int	Beyond the size of the left shift	Constant
 */
void bit_shift_003_good ()
{
	unsigned int a = 1;
	unsigned int ret;
	ret = a << 10; /*Tool should  Not detect this line as error*/ /*NO ERROR:Bit shift error*/

}

int main(){
  bit_shift_003_good();
	bit_shift_003_bad();
  return 0;
}
