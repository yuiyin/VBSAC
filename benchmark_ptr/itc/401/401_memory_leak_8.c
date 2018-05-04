// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
* Defect Classification
* ---------------------
* Defect Type: Resource management defects
* Defect Sub-type: Memory leakage
*
*/

#include <stdlib.h>

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
*  When using 1 single pointer alias
*/
void memory_leak_008_bad()
{
	int *ptr=(int*) malloc(5 * sizeof(int));
	int *p = (int*)malloc(5 * sizeof(int));/*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
	if(ptr !=NULL)
	{
	p = ptr;
	*(p+1) = 1;
	free(ptr);
	}
}

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
*  When using 1 single pointer alias
*/
void memory_leak_008_good()
{
	int *ptr=(int*) malloc(5 * sizeof(int)); /*Tool should not detect  this line as error*/ /*No ERROR:Memory Leakage */
	int *p = NULL ;
	if(ptr !=NULL)
	{
	   p = ptr;
	   *(p+1) = 1;
	   free (ptr);
	   ptr = NULL;
	}
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity:Memory Leakage main function
*/

int main ()
{
	memory_leak_008_good();
	memory_leak_008_bad();
	return 0;
}
