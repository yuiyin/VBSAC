// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: overflow
 * Complexity: Overflow in int + 1	Constant
 */
void data_overflow_003_bad ()
{
	int max = 0x7fffffff;
	int ret;
	ret = max + 1;/*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

/*
 * Types of defects: overflow
 * Complexity: int	Overflow with + 1	Constant
 */
void data_overflow_003_good ()
{
	int max = 0x7ffffffe;
	int ret;
        // JDR: fixed a signed overflow in next line
	ret = max + 1;/*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

int main(){
	data_overflow_003_good();
	data_overflow_003_bad();
	return 0;
}
