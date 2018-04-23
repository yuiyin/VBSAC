// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: uninitialized variable
 * Complexity: structure Int Variable	Loading
 */
typedef struct{
 	int a;
	int b;
	int uninit;
} uninit_var_007_s_001;

void uninit_var_007_bad(){
	uninit_var_007_s_001 s;
	int ret;
	s.a = 1;
	s.b = 1;
	ret = s.uninit;/*Tool should detect this line as error*/ /*ERROR:Uninitialized Variable*/
}

/*
 * Types of defects: uninitialized variable
 * Complexity: structure	int	Variable	Loading
 */
void uninit_var_007_good()
{
	uninit_var_007_s_001 s;
	int ret;
	s.a = 1;
	s.b = 1;
	s.uninit = 1;
	ret = s.uninit; /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Variable*/

}

int main (){
  uninit_var_007_good();
	uninit_var_007_bad();
	return 0;
}
