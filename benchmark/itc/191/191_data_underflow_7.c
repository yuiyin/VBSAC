// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: underflow
 * Complexity: int	Underflow at Function arguments
 */
void data_underflow_011_func_001_bad (int d)
{
	int min = -2147483647;
	int ret;
	ret = min - d; /*Tool should detect this line as error*/ /*ERROR:Data Underflow*/

}

void data_underflow_011_bad ()
{
	data_underflow_011_func_001_bad(2);
}

/*
 * Types of defects: underflow
 * Complexity: int	Underflow at Function arguments
 */
void data_underflow_011_func_001_good (int d)
{
	int min = -2147483646;
	int ret;
	ret = min - d; /*Tool should Not detect this line as error*/ /*No ERROR:Data Underflow*/

}

void data_underflow_011_good ()
{
	data_underflow_011_func_001_good(2);
}

int main() {
	data_underflow_011_good();
  data_underflow_011_bad();
  return 0;
}
