// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: overflow
 * Complexity: int	Overflow at	An array of element values
 */
void data_overflow_020_bad ()
{
	int max = 0x7fffffff;
	int dlist[4] = {0, 1, -2, -1};
	int ret;
	ret = max + dlist[1]; /*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

/*
 * Types of defects: overflow
 * Complexity: int	Overflow with + 1	An array of element values
 */
void data_overflow_020_good ()
{
	int max = 0x7ffffffe;
	int dlist[4] = {4, 1, 3, 2};
	int ret;
	ret = max + dlist[1];/*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

int main(){
	data_overflow_020_good();
	data_overflow_020_bad();
	return 0;
}
