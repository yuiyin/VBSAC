// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: uninitialized variable
 * Complexity: 2-dimensional array	int	Variable	Loading
 */
void uninit_var_003_bad(){
	int buf[5][6];
	int ret;
	ret = buf[1][1];/*Tool should detect this line as error*/ /*ERROR:Uninitialized Variable*/
}

/*
 * Types of defects: uninitialized variable
 * Complexity: 2-dimensional array	int	Variable	Loading
 */
void uninit_var_003_good()
{
	int buf[5][6] = {{1,2,3,4,5,6},
			         {11,12,13,14,15,16},
	                 {21,22,23,24,25,26},
	                 {31,32,33,34,35,36},
	                 {41,42,43,44,45,46}};
	int ret;
	ret = buf[1][1]; /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Variable*/

}

int main (){
	uninit_var_003_good();
	uninit_var_003_bad();
	return 0;
}
