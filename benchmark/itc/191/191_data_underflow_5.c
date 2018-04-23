// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: underflow
 * Complexity:  underflow (char)
 */
void data_underflow_009_bad ()
{
	char min = -128;	/* 0x80000002 */
	char ret;
	ret = min - 2;/*Tool should detect this line as error*/ /*ERROR:Data Underflow*/

}

/*
 * Types of defects: underflow
 * Complexity:  underflow (char)
 */
void data_underflow_009_good ()
{
	char min = -126;	/* 0x80000002 */
	char ret;
	ret = min - 2; /*Tool should Not detect this line as error*/ /*No ERROR:Data Underflow*/

}

int main() {
  data_underflow_009_good();
	data_underflow_009_bad();
  return 0;
}
