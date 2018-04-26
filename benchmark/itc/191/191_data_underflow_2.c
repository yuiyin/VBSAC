// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: underflow
 * Complexity: int	Decrement	--
 */
void data_underflow_003_bad ()
{
	int min = -2147483647;	/* 0x80000001 */
	int ret;
	min --;
	min --;
	ret = min;/*Tool should detect this line as error*/ /*ERROR:Data Underflow*/

}

/*
 * Types of defects: underflow
 * Complexity: int	Underflow with decrement operator --
 */
void data_underflow_003_good ()
{
	int min = -2147483646;	/* 0x80000002 */
	int ret;
	min --;
	min --;
	ret = min; /*Tool should Not detect this line as error*/ /*No ERROR:Data Underflow*/

}

int main() {
  data_underflow_003_good();
	data_underflow_003_bad();
  return 0;
}
