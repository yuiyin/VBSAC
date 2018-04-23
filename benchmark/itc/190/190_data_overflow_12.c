// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: overflow
 * Complexity: int	Overflow with + 1	The return value of the function
 */
int data_overflow_018_func_001 ()
{
	return 1;
}

void data_overflow_018_bad ()
{
	int max = 0x7fffffff;
	int ret;
	ret = max + data_overflow_018_func_001(); /*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

void data_overflow_018_good ()
{
	int max = 0x7ffffffe;
	int ret;
	ret = max + data_overflow_018_func_001();/*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

int main(){
	data_overflow_018_good();
	data_overflow_018_bad();
	return 0;
}
