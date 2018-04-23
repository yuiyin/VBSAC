// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: underflow
 * Complexity: the operands is a constant
 */
void data_underflow_006_bad ()
{
	int ret;
	ret = (-2147483647) - 2;/*Tool should detect this line as error*/ /*ERROR:Data Underflow*/

}

/*
 * Types of defects: underflow
 * Complexity: the operands is a constant
 */
void data_underflow_006_good ()
{
	int ret;
	ret = (-2147483646) - 2; /*Tool should Not detect this line as error*/ /*No ERROR:Data Underflow*/

}

int main() {
  data_underflow_006_good();
	data_underflow_006_bad();
  return 0;
}
