// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: underflow
 * Complexity: int	underflow with -128 Constant
 */
void data_underflow_004_bad ()
{
	int min = -2147483521;
	int ret;
	ret = min - 128;/*Tool should detect this line as error*/ /*ERROR:Data Underflow*/

}

/*
 * Types of defects: underflow
 * Complexity: int	-128 At the underflow	Constant
 */
void data_underflow_004_good ()
{
	int min = -2147483520;
	int ret;
	ret = min - 128; /*Tool should Not detect this line as error*/ /*No ERROR:Data Underflow*/

}

int main() {
  data_underflow_004_good();
	data_underflow_004_bad();
  return 0;
}
