// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: uninitialized variable
 * Complexity: int variable initialized with function return value using enumeration
 */
typedef enum {ZERO, ONE, TWO } values;

int uninit_var_013_func_001_bad(void ){
	values val ;/*Tool should detect this line as error*/ /*ERROR:Uninitialized Variable*/
	return val;
}

void uninit_var_013_bad(){
    int a;
    a = uninit_var_013_func_001_bad();
}

/*
 * Types of defects: uninitialized variable
 * Complexity: int variable initialized with function return value using enumeration
 */
int uninit_var_013_func_001_good(void )
{
	values val = ONE; /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Variable*/
	return val;
}

void uninit_var_013_good()
{
    int a;
    a = uninit_var_013_func_001_good();

}

int main (){
	uninit_var_013_good();
	uninit_var_013_bad();
	return 0;
}
