// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: Underflow
 * Complexity: int	underflow at	An array of element values
 */
void data_underflow_012_bad ()
{
	int min = -2147483647;
	int dlist[4] = {0, 1, -2, -1};
	int ret;
	ret = min + dlist[2]; /*Tool should detect this line as error*/ /*ERROR:Data underflow*/

}

/*
 * Types of defects: Underflow
 * Complexity: int	underflow at	An array of element values
 */
void data_underflow_012_good ()
{
	int min = -2147483646;
	int dlist[4] = {0, 1, -2, -1};
	int ret;
	ret = min + dlist[2]; /*Tool should Not detect this line as error*/ /*No ERROR:Data Underflow*/

}

int main() {
  data_underflow_012_good();
	data_underflow_012_bad();
  return 0;
}
