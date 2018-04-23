// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	Alias for 1 weight
 */
void bit_shift_015_bad ()
{
	int a = 1;
	int shift = 32;
	int shift1;
	int ret;
	shift1 = shift;
	ret = a << shift1;/*Tool should detect this line as error*/ /*ERROR:Bit shift error*/

}

/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	Alias for 1 weight
 */
void bit_shift_015_good ()
{
	int a = 1;
	int shift = 10;
	int shift1;
	int ret;
	shift1 = shift;
	ret = a << shift1;/*Tool should  Not detect this line as error*/ /*NO ERROR:Bit shift error*/

}

int main(){
  bit_shift_015_good();
	bit_shift_015_bad();
  return 0;
}
