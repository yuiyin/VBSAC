// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include <math.h>

int rand (void);
/*
 * Types of defects: overflow
 * Complexity: int	Overflow at Value of random variable + 1
 */
void data_overflow_015_bad ()
{
	int max = 0x7fffffff;
	int d;
	int ret;
	d = rand();
	ret = max + d; /*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

/*
 * Types of defects: overflow
 * Complexity: int	Overflow with + 1	Value of random variable
 */
void data_overflow_015_good ()
{
	int max = 0x7ffffffe;
	int d;
	int ret;
	d = rand() % 2;
	ret = max + d;/*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

int main(){
	data_overflow_015_good();
	data_overflow_015_bad();
	return 0;
}
