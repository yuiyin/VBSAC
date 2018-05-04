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
* Complexity:double Free in a while loop with a condition
*/

void double_free_011_bad()
{
	char* ptr= (char*) malloc(sizeof(char));
	if (ptr == NULL) return;
	int flag=1,a=0,b=2;

	while(a<b)
	{
		if(flag ==1)
		free(ptr); /*Tool should detect this line as error*/ /*ERROR:Double free*/
		a++;
	}
}

/*
* Types of defects: Double free
* Complexity:double Free in a while loop with a condition
*/

void double_free_011_good()
{
	char* ptr= (char*) malloc(sizeof(char));
	if (ptr == NULL) return;
	int flag=1,a=0,b=1;

	while(a<b)
	{
		if(flag ==1)
		free(ptr);  /*Tool should Not detect this line as error*/ /*No ERROR:Double free*/
		a++;
	}
}

/*
* Types of defects: Double free
* double free main function
*/

int main ()
{
	double_free_011_good();
	double_free_011_bad();
	return 0;
}
