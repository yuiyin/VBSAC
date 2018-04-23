// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: overflow
 * Complexity: int	Increment ++ operator
 */
void data_overflow_011_bad ()
{
	int max = 0x7fffffff;
	int ret;
	max ++;
	ret = max;/*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

/*
 * Types of defects: overflow
 * Complexity: int	Increment	++
 */
void data_overflow_011_good ()
{
	int max = 0x7ffffffe;
	int ret;
	max ++;
	ret = max;/*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

int main(){
	data_overflow_011_good();
	data_overflow_011_bad();
	return 0;
}
