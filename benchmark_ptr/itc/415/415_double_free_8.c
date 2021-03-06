// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
* Defect Classification
* ---------------------
* Defect Type: Resource management defects
* Defect Sub-type: Double free
*
*/

#include <stdlib.h>

/*
* Types of defects: Double free
* Complexity:Free in a function
*/
char *double_free_function_008_gbl_ptr_bad;
void double_free_function_008_bad()
{
	free (double_free_function_008_gbl_ptr_bad);
}

void double_free_008_bad()
{
	double_free_function_008_gbl_ptr_bad= (char*) malloc(sizeof(char));
if (double_free_function_008_gbl_ptr_bad == NULL) return;
	double_free_function_008_bad();
	free(double_free_function_008_gbl_ptr_bad); /*Tool should detect this line as error*/ /*ERROR:Double free*/
}

/*
* Types of defects: Double free
* Complexity:Free in a function
*/
char *double_free_function_008_gbl_ptr_good;
void double_free_function_008_good()
{
	free (double_free_function_008_gbl_ptr_good); /*Tool should Not detect this line as error*/ /*No ERROR:Double free*/
}

void double_free_008_good()
{
	double_free_function_008_gbl_ptr_good= (char*) malloc(sizeof(char));
	if (double_free_function_008_gbl_ptr_good == NULL) return;
	double_free_function_008_good();
}

/*
* Types of defects: Double free
* double free main function
*/

int main ()
{
	double_free_008_good();
	double_free_008_bad();
	return 0;
}
