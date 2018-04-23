// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: uninitialized variable
 * Complexity: Static Int variable initialized by return value of function with a condition in while loop
 */
// int uninit_var_008_func_001_good(int a){
// 	static int ret_bad;
// 	ret_bad -= a;
// 	return ret_bad;
// }

// void uninit_var_008_good(){
//     int flag = 1;
//     int data;
//     while(uninit_var_008_func_001_good(flag)>0){
//         	data +=flag;/*Tool should not detect this line as error*/ /*ERROR:Uninitialized Variable*/
//     }
// }

/*
 * Types of defects: uninitialized variable
 * Complexity: Static Int variable initialized by return value of function with a condition in while loop
 */
int _bad(int a)
{
	static int ret_good=10;
	ret_good -= a;
	return ret_good;
}

void u_bad()
{
    int flag = 1;
    int data;
    while(_bad(flag)>0)
    {
    	data +=flag; /*Tool should detect this line as error*/ /*No ERROR:Uninitialized Variable*/
    }
}

int main (){
	u_bad();
	// uninit_var_008_good();
	return 0;
}
