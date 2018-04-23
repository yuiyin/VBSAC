// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: underflow
 * Complexity: int	Underflow at The return value of the function
 */
int data_underflow_010_func_001 ()
{
	return 2;
}

void data_underflow_010_bad ()
{
	int min = -2147483647;
	int ret;
	ret = min - data_underflow_010_func_001(); /*Tool should detect this line as error*/ /*ERROR:Data Under*/

}

void data_underflow_010_good ()
{
	int min = -2147483646;
	int ret;
	ret = min - data_underflow_010_func_001(); /*Tool should Not detect this line as error*/ /*No ERROR:Data Underflow*/

}

int main() {
  data_underflow_010_good();
	data_underflow_010_bad();
  return 0;
}
