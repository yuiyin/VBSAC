// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: overflow
 * Complexity: int	Overflow at Linear equation
 */
void data_overflow_016_bad ()
{
	int max = 429496729;
	int ret;
	ret = (5 * max) + 3; /*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

/*
 * Types of defects: overflow
 * Complexity: int	Overflow with + 1	Linear equation
 */
void data_overflow_016_good ()
{
	int max = 429496729;
	int ret;
	ret = (5 * max) + 2;/*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

int main(){
	data_overflow_016_good();
	data_overflow_016_bad();
	return 0;
}
