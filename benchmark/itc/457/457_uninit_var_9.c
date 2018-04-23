// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: uninitialized variable
 * Complexity: 2-dimensional array	int	Function arguments	Loading
 */
void uninit_var_010_func_001_bad(int buf[][6]){
	int ret[2][6];
	int i,j;
	for (i=0;i<2;i++)
		for (j=0;j<6;j++)
			buf[i][j] = ret[i][j];}/*Tool should detect this line as error*/ /*ERROR:Uninitialized Variable*/

void uninit_var_010_bad(){
	int buf[2][6];
	uninit_var_010_func_001_bad(buf);
}

/*
 * Types of defects: uninitialized variable
 * Complexity: pointer arrays	int	Function arguments	Loading
 */
void uninit_var_010_func_001_good(int buf[][6])
{
	int ret[2][6] = {{1,2,3,4,5,6},
			         {11,12,13,14,15,16}};
	int i,j;
	for (i=0;i<2;i++)
		for (j=0;j<6;j++)
			buf[i][j] = ret[i][j]; /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Variable*/
}

void uninit_var_010_good()
{
	int buf[2][6] ;
	uninit_var_010_func_001_good(buf);
}

int main (){
	uninit_var_010_good();
	uninit_var_010_bad();
	return 0;
}
