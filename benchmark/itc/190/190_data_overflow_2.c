// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: overflow
 * Complexity: Overflow in short + 1	Constant
 */
void data_overflow_002_bad ()
{
	short max = 0x7fff;
	short ret;
	ret = max + 1;/*Tool should detect this line as error*/ /*ERROR:Data Overflow*/

}

/*
 * Types of defects: overflow
 * Complexity: a short	Overflow with + 1	Constant
 */
void data_overflow_002_good ()
{
	short max = 0x7ff0;
	short ret;
	ret = max + 2; /*Tool should Not detect this line as error*/ /*No ERROR:Data Overflow*/

}

int main(){
	data_overflow_002_good();
	data_overflow_002_bad();
	return 0;
}
