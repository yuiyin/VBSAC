// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: uninitialized variable
 * Complexity: 1-dimensional array	int	Variable	Loading
 */
void uninit_var_002_bad(){
	int buf[5];
	int ret;
	ret = buf[3];/*Tool should detect this line as error*/ /*ERROR:Uninitialized Variable*/
}

/*
 * Types of defects: uninitialized variable
 * Complexity: 1-dimensional array	int	Variable	Loading
 */
void uninit_var_002_good()
{
	int buf[5] = {1, 2, 3, 4, 5};
	int ret;
	ret = buf[3]; /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Variable*/

}

int main (){
	uninit_var_002_good();
	uninit_var_002_bad();
	return 0;
}
