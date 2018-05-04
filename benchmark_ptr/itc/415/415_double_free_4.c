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
#include <math.h>

int rand();

/*
* Types of defects: Double free
* Complexity: Memory is free in a if statement
*/

void double_free_004_bad()
{
	char* ptr= (char*) malloc(10*sizeof(char));
	if (ptr == NULL) return;
	int i;
	for(i=0;i<10;i++)
	{
		*(ptr+i)='a';
	}

	if (rand() % 2==0)
	{
		free(ptr);
	}

	if(rand() % 3==0)
	free(ptr); /*Tool should detect this line as error*/ /*ERROR:Double free*/
}

/*
* Types of defects: Double free
* Complexity: Memory is free in a if statement
*/

void double_free_004_good()
{
	char* ptr= (char*) malloc(10*sizeof(char));
	if (ptr == NULL) return;
	int i;
	for(i=0;i<10;i++)
	{
		*(ptr+i)='a';

	}
	free(ptr); /*Tool should Not detect this line as error*/ /*No ERROR:Double free*/
}

/*
* Types of defects: Double free
* double free main function
*/

int main ()
{
	double_free_004_good();
	double_free_004_bad();
	return 0;
}
