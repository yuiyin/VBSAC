// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	Also known as double
 */
void bit_shift_016_bad ()
{
	int a = 1;
	int shift = 32;
	int shift1;
	int shift2;
	int ret;
	shift1 = shift;
	shift2 = shift1;
	ret = a << shift2;/*Tool should detect this line as error*/ /*ERROR:Bit shift error*/

}

/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	Also known as double alias
 */
void bit_shift_016_good ()
{
	int a = 1;
	int shift = 10;
	int shift1;
	int shift2;
	int ret;
	shift1 = shift;
	shift2 = shift1;
	ret = a << shift2;/*Tool should  Not detect this line as error*/ /*NO ERROR:Bit shift error*/

}

int main(){
  bit_shift_016_good();
	bit_shift_016_bad();
  return 0;
}
