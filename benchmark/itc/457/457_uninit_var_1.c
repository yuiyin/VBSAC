// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: uninitialized variable
 * Complexity: basic types	int	Variable	Loading
 */
void uninit_var_001_bad(){
	int a ;
	int ret;
	ret = a;/*Tool should detect this line as error*/ /*ERROR:Uninitialized Variable*/
}

/*
 * Types of defects: uninitialized variable
 * Complexity: basic types	int	Variable	Loading
 */
void uninit_var_001_good()
{
	int a = 0;
	int ret;
	ret = a; /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Variable*/

}

int main (){
	uninit_var_001_good();
	uninit_var_001_bad();
	return 0;
}
