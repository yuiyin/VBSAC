// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include <math.h>

int rand (void);
/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	Value of random variable
 */
void bit_shift_009_bad ()
{
	int a = 1;
	int shift;
	int ret;
	shift = rand();
	ret = a << shift;/*Tool should detect this line as error*/ /*ERROR:Bit shift error*/

}

/*
 * Types of defects: BitShift errors
 * Complexity: int	Beyond the size of the left shift	Value of random variable
 */
void bit_shift_009_good ()
{
	int a = 1;
	int shift;
	int ret;
	shift = rand() % 30;
	ret = a << shift;/*Tool should  Not detect this line as error*/ /*NO ERROR:Bit shift error*/

}

int main(){
  bit_shift_009_good();
	bit_shift_009_bad();
  return 0;
}
