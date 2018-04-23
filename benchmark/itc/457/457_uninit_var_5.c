// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * Types of defects: uninitialized variable
 * Complexity: long variable initialized in a ternary conditional operator
 */
void uninit_var_006_bad(){
    long a;
    int flag =0;
    (flag==10)? (a = 1):(flag =a);/*Tool should detect this line as error*/ /*ERROR:Uninitialized Variable*/
}

/*
 * Types of defects: uninitialized variable
 * Complexity: long Variable Write - using a conditional statement
 */
void uninit_var_006_good()
{
    long a;
    int flag =10;
    (flag==10)? (a = 1):(a = 5); /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Variable*/
}

int main (){
	uninit_var_006_good();
  uninit_var_006_bad();
	return 0;
}
