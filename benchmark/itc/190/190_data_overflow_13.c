// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: overflow
 * Complexity: int	Overflow at Function arguments
 */
void data_overflow_019_func_001_bad (int d)
{
	int max = 0x7fffffff;
	int ret;
	ret = max + d; /*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

void data_overflow_019_bad ()
{
	data_overflow_019_func_001_bad(1);
}

/*
 * Types of defects: overflow
 * Complexity: int	Overflow with + 1	Function arguments
 */
void data_overflow_019_func_001_good (int d)
{
	int max = 0x7ffffffe;
	int ret;
	ret = max + d;/*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

void data_overflow_019_good ()
{
	data_overflow_019_func_001_good(1);
}

int main(){
	data_overflow_019_good();
	data_overflow_019_bad();
	return 0;
}
