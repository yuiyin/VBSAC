// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	The return value of the function
 */
int bit_shift_012_func_001_bad ()
{
	return 32;
}

void bit_shift_012_bad ()
{
	int a = 1;
	int ret;
	ret = a << bit_shift_012_func_001_bad();/*Tool should detect this line as error*/ /*ERROR:Bit shift error*/

}

/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	The return value of the function
 */
int bit_shift_012_func_001_good ()
{
	return 10;
}

void bit_shift_012_good ()
{
	int a = 1;
	int ret;
	ret = a << bit_shift_012_func_001_good();/*Tool should  Not detect this line as error*/ /*NO ERROR:Bit shift error*/

}

int main(){
  bit_shift_012_good();
	bit_shift_012_bad();
  return 0;
}
