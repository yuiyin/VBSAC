// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include <string.h>

/*
 * Types of defects: uninitialized variable
 * Complexity: char array	Function arguments	Loading
 */
void uninit_var_009_func_001_bad(char buf[]){
	char ret[25];
	strcpy(buf,ret);/*Tool should detect this line as error*/ /*ERROR:Uninitialized Variable*/
}

void uninit_var_009_bad(){
	char buf[25] ;
	uninit_var_009_func_001_bad(buf);
}

/*
 * Types of defects: uninitialized variable
 * Complexity: char array	Function arguments	Loading
 */
void uninit_var_009_func_001_good(char buf[])
{
	char ret[] = "This is a string";
	strcpy(buf,ret); /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Variable*/
}

void uninit_var_009_good()
{
	char buf[25] ;
	uninit_var_009_func_001_good(buf);
}

int main (){
	uninit_var_009_good();
	uninit_var_009_bad();
	return 0;
}
