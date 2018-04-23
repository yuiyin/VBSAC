// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: BitShift errors
 * Complexity: the operands is a constant
 */
void bit_shift_017_bad ()
{
	int ret;
	ret = 1 << 32;/*Tool should detect this line as error*/ /*ERROR:Bit shift error*/

}

/*
 * Types of defects: BitShift errors
 * Complexity: the operands is a constant
 */
void bit_shift_017_good ()
{
	int ret;
	ret = 1 << 10;/*Tool should  Not detect this line as error*/ /*NO ERROR:Bit shift error*/

}

int main(){
  bit_shift_017_good();
	bit_shift_017_bad();
  return 0;
}
