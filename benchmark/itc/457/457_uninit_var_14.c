// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: uninitialized variable
 * Complexity: structure int Function arguments	Loading
 */
typedef struct{
	int a;
	int b;
	int uninit;
} uninit_var_014_s_001;

uninit_var_014_s_001 uninit_var_014_func_001_bad(uninit_var_014_s_001 s1){
	uninit_var_014_s_001 ret;
	ret.a = (++s1.a);
	ret.b = (++s1.b);
	ret.uninit = (++s1.uninit);/*Tool should detect this line as error*/ /*ERROR:Uninitialized Variable*/
	return ret;
}

void uninit_var_014_bad(){
	uninit_var_014_s_001 s,r;
	s.a = 1;
	s.b = 1;
	r = uninit_var_014_func_001_bad(s);
}

/*
 * Types of defects: uninitialized variable
 * Complexity: structure int	Function arguments	Loading
 */
uninit_var_014_s_001 uninit_var_014_func_001_good(uninit_var_014_s_001 s1){
	uninit_var_014_s_001 ret;
	ret.a = (++s1.a);
	ret.b = (++s1.b);
	ret.uninit = (++s1.uninit); /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Variable*/
	return ret;
}

void uninit_var_014_good()
{
	uninit_var_014_s_001 s,r;
	s.a = 1;
	s.b = 1;
	s.uninit = 1;
	r = uninit_var_014_func_001_good(s);
        r.a = 0;

}

int main (){
	uninit_var_014_good();
	uninit_var_014_bad();
	return 0;
}
