// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
  * Types of defects: bit shift error
  * Complexity: constant shift to the left beyond the int size
  */
void bit_shift_001_bad ()
{
	int a = 1;
	int ret;
	ret = a << 32;/*Tool should detect this line as error*/ /*ERROR:Bit shift error*/

}

/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	Constant
 */
void bit_shift_001_good ()
{
	int a = 1;
	int ret;
	ret = a << 10;/*Tool should  Not detect this line as error*/ /*NO ERROR:Bit shift error*/

}

int main(){
  bit_shift_001_good();
	bit_shift_001_bad();
  return 0;
}
