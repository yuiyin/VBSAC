// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: underflow
 * Complexity: int	Multiply by underflow	Constant
 */
void data_underflow_005_bad ()
{
	int min = -1073741825;	/* 0xbfffffff */
	int ret;
	ret = min * 2;/*Tool should detect this line as error*/ /*ERROR:Data Underflow*/

}

/*
 * Types of defects: underflow
 * Complexity: int	Multiply by underflow	Constant
 */
void data_underflow_005_good ()
{
	int min = -1073741824;	/* 0xc0000000 */
	int ret;
	ret = min * 2; /*Tool should Not detect this line as error*/ /*No ERROR:Data Underflow*/

}

int main() {
  data_underflow_005_good();
	data_underflow_005_bad();
  return 0;
}
