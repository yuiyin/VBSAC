// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: overflow
 * Complexity: int	Overflow at + 1	Variable
 */
void data_overflow_014_bad ()
{
	int max = 0x7fffffff;
	int d = 1;
	int ret;
	ret = max + d;/*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

/*
 * Types of defects: overflow
 * Complexity: int	Overflow with + 1	Variable
 */
void data_overflow_014_good ()
{
	int max = 0x7ffffffe;
	int d = 1;
	int ret;
	ret = max + d;/*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

int main(){
	data_overflow_014_good();
	data_overflow_014_bad();
	return 0;
}
