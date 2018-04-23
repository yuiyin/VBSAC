// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	Function arguments
 */
void bit_shift_013_func_001 (int shift)
{
	int a = 1;
	int ret;
	ret = a << shift;/*Tool should detect this line as error*/ /*ERROR:Bit shift error*/

}

void bit_shift_013_bad ()
{
	bit_shift_013_func_001(32);
}

void bit_shift_013_good ()
{
	bit_shift_013_func_001(10);
}

int main(){
  bit_shift_013_good();
	bit_shift_013_bad();
  return 0;
}
