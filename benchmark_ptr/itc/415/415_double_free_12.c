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
* Complexity:double Free in a for loop
*/

void double_free_012_bad()
{
	char* ptr= (char*) malloc(sizeof(char));
	if (ptr == NULL) return;
	int a=0;

	for(a=0;a<2;a++)
	{
		free(ptr); /*Tool should detect this line as error*/ /*ERROR:Double free*/
	}
}

/*
* Types of defects: Double free
* Complexity:double Free in a for loop
*/

void double_free_012_good()
{
	char* ptr= (char*) malloc(sizeof(char));
	if (ptr == NULL) return;
	int a=0;

	for(a=0;a<1;a++)
	{
		free(ptr); /*Tool should Not detect this line as error*/ /*No ERROR:Double free*/
	}
}

/*
* Types of defects: Double free
* double free main function
*/

int main ()
{
	double_free_012_good();
	double_free_012_bad();
	return 0;
}
