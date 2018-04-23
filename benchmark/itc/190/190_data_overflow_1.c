// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
void data_overflow_001_bad ()
{
	char max = 0x7f;
	char ret;
	ret = max + 1;/*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

/*
 * Types of defects: overflow
 * Complexity: char	Overflow with + 1	Constant
 */
void data_overflow_001_good ()
{
	char max = 0x70;
	char ret;
	ret = max + 2; /*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

int main(){
	data_overflow_001_good();
	data_overflow_001_bad();
	return 0;
}
