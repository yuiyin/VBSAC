// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: uninitialized variable
 * Complexity: 1-dimensional array	int	Function arguments	Loading and
 * initialized with return value of function
 */
int uninit_var_011_func_001_bad(int arr1[],int a){
	int ret=0;
	if(arr1[0] > 0)
		ret = a+arr1[1];/*Tool should detect this line as error*/ /*ERROR:Uninitialized Variable*/
		return ret ;
}

void uninit_var_011_bad(){
	int arr[5];
	int p ;
	arr[0] = 1;
	p= uninit_var_011_func_001_bad(arr,(sizeof(arr)/sizeof(int)));
}

/*
 * Types of defects: uninitialized variable
 * Complexity: 1-dimensional array	int	Function arguments	Loading and
 * initialized with return value of function
 */
int uninit_var_011_func_001_good(int arr1[],int a)
{
	int ret=0;
	if(arr1[0] > 0)
		ret = a+arr1[1]; /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Variable*/
		return ret ;
}

void uninit_var_011_good()
{
	int arr[] = {1, 2, 3, 4, 5, 6};
	int p ;
	p= uninit_var_011_func_001_good(arr,(sizeof(arr)/sizeof(int)));

}

int main (){
	uninit_var_011_good();
	uninit_var_011_bad();
	return 0;
}
