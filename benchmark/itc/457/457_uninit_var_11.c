// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: uninitialized variable
 */
struct uninit_var{
	 int a;
	 int uninit;
} ;



void uninit_var_012_bad(){
	struct uninit_var s;
	s.a = 2;
	int ret;
	ret = s.a +s.uninit; /*Tool should detect this line as error*/ /*ERROR:Uninitialized Variable*/
}



void uninit_var_012_good()
{
	struct uninit_var s,r;
	s.a = 2;
	s.uninit = 2;
	int ret;
	ret = s.a +s.uninit;


}

int main (){
	uninit_var_012_good();
	uninit_var_012_bad();
	return 0;
}
