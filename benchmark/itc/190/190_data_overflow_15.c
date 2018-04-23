// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: overflow
 * Complexity: int	Overflow at Also known as double
 */
void data_overflow_022_bad ()
{
	int max = 0x7fffffff;
	int d = 1;
	int d1;
	int d2;
	int ret;
	d1 = d;
	d2 = d1;
	ret = max + d2; /*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

/*
 * Types of defects: overflow
 * Complexity: int	Overflow with + 1	Also known as double alias
 */
void data_overflow_022_good ()
{
	int max = 0x7ffffffe;
	int d = 1;
	int d1;
	int d2;
	int ret;
	d1 = d;
	d2 = d1;
	ret = max + d2;/*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

int main(){
	data_overflow_022_good();
	data_overflow_022_bad();
	return 0;
}
