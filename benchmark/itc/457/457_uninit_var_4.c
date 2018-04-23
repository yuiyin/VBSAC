// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: uninitialized variable
 * Complexity: basic types	int	Function arguments	Loading
 */
int uninit_var_005_func_001_bad(void){
	int ret;
	if (0)
		ret = 1;
	return ret;/*Tool should detect this line as error*/ /*ERROR:Uninitialized Variable*/
}

void uninit_var_005_bad(){
	int a;
	a = uninit_var_005_func_001_bad();
}

/*
 * Types of defects: uninitialized variable
 * Complexity: basic types	int	Function arguments	Loading
 */
int uninit_var_005_func_001_good(void)
{
	int ret;
	if (1)
		ret = 1;
	return ret; /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Variable*/
}

void uninit_var_005_good()
{
	int a;
	a = uninit_var_005_func_001_good();

}

int main (){
	uninit_var_005_good();
	uninit_var_005_bad();
	return 0;
}
