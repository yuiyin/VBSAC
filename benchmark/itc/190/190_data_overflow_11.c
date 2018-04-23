// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: overflow
 * Complexity: int	Overflow at Nonlinear equation
 */
void data_overflow_017_bad ()
{
	int max = 46340;
	int ret;
	ret = (max * max) + 88048; /*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

/*
 * Types of defects: overflow
 * Complexity: int	Overflow with + 1	Nonlinear equation
 */
void data_overflow_017_good ()
{
	int max = 46340;
	int ret;
	ret = (max * max) + 88047;/*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

int main(){
	data_overflow_017_good();
	data_overflow_017_bad();
	return 0;
}
