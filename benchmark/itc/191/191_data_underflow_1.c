// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: underflow
 * Complexity: int	Underflow with -2	Constant
 */
void data_underflow_001_bad ()
{
	int min = -2147483647;	/* 0x80000001 */
	int ret;
	ret = min - 2;/*Tool should detect this line as error*/ /*ERROR:Data Underflow*/

}

/*
 * Types of defects: underflow
 * Complexity: int	Underflow is with -2	Constant
 */
void data_underflow_001_good ()
{
	int min = -2147483646;	/* 0x80000001 */
	int ret;
	ret = min - 2; /*Tool should Not detect this line as error*/ /*No ERROR:Data Underflow*/

}

int main() {
  data_underflow_001_good();
	data_underflow_001_bad();
  return 0;
}
