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
* Complexity: Memory is free in a if statement
*/

void double_free_005_bad()
{
	char* ptr= (char*) malloc(sizeof(char));
	if (ptr == NULL) return;
	free(ptr);

	if(ptr)
	free(ptr); /*Tool should detect this line as error*/ /*ERROR:Double free*/
}

/*
* Types of defects: Double free
* Complexity: Memory is free in a if statement
*/

void double_free_005_good()
{
	char* ptr= (char*) malloc(sizeof(char));
if (ptr == NULL) return;
	if(ptr)
	free(ptr); /*Tool should Not detect this line as error*/ /*No ERROR:Double free*/
}

/*
* Types of defects: Double free
* double free main function
*/

int main ()
{
	double_free_005_good();
	double_free_005_bad();
	return 0;
}
