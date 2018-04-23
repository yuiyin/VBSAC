// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: uninitialized variable
 * Complexity: Array initialized in a  function using macro's
 */
#define ZERO 0
#define ONE  1
#define TWO  2
void uninit_var_015_func_001_bad(int a[] ){
	a[0] = ZERO;
	a[2] = TWO;
}

void uninit_var_015_bad(){
    int a[3],ret;
    uninit_var_015_func_001_bad(a);
    ret = a[1];/*Tool should detect this line as error*/ /*ERROR:Uninitialized Variable*/
}

/*
 * Types of defects: uninitialized variable
 * Complexity: Array initialized in a  function using macro's
 */
void uninit_var_015_func_001_good(int a[] )
{
	a[0] = ZERO;
	a[1] = ONE;
	a[2] = TWO;
}

void uninit_var_015_good()
{
    int a[3];
    uninit_var_015_func_001_good(a); /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Variable*/
}


int main (){
	uninit_var_015_good();
	uninit_var_015_bad();
	return 0;
}
