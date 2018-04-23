// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	An array of element values
 */
void bit_shift_014_bad ()
{
	int a = 1;
	int shifts[5] = {8, 40, 16, 32, 24};
	int ret;
	ret = a << shifts[3];/*Tool should detect this line as error*/ /*ERROR:Bit shift error*/

}

/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	An array of element values
 */
void bit_shift_014_good ()
{
	int a = 1;
	int shifts[5] = {8, 40, 32, 16, 24};
	int ret;
	ret = a << shifts[3];/*Tool should  Not detect this line as error*/ /*NO ERROR:Bit shift error*/

}

int main(){
  bit_shift_014_good();
	bit_shift_014_bad();
  return 0;
}
