// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: overflow
 * Complexity: int	Overflow + 128	Constant
 */
void data_overflow_012_bad ()
{
	int max = 0x7fffff80;
	int ret;
	ret = max + 128;/*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

/*
 * Types of defects: overflow
 * Complexity: int	Overflow with + 128	Constant
 */
void data_overflow_012_good ()
{
	int max = 0x7fffff7f;
	int ret;
	ret = max + 128;/*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

int main(){
	data_overflow_012_good();
	data_overflow_012_bad();
	return 0;
}
