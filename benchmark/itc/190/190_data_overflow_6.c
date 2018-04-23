// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: overflow
 * Complexity: int	That overflow in multiplication	Constant
 */
void data_overflow_013_bad ()
{
	int max = 0x40000000;
	int ret;
	ret = max * 2;/*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

/*
 * Types of defects: overflow
 * Complexity: int	That overflow in multiplication	Constant
 */
void data_overflow_013_good ()
{
	int max = 0x3fffffff;
	int ret;
	ret = max * 2;/*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

int main(){
	data_overflow_013_good();
	data_overflow_013_bad();
	return 0;
}
