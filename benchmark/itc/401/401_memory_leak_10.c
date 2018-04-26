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
*  When using 2 single pointer alias
*/
void memory_leak_0010_bad()
{
	int *ptr = (int*) calloc(5,sizeof(int));
	if (ptr == NULL)
	{
		return;
	}
	int *p1 = (int*) calloc(5,sizeof(int));/*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
	int *p2 = NULL;
	p1 = ptr;
	p2 = p1;
	*(p2+4) = 1;
	free(ptr);
}

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
*  When using 2 single pointer alias
*/
void memory_leak_0010_good()
{
	int *ptr = (int*) calloc(5,sizeof(int)); /*Tool should not detect  this line as error*/ /*No ERROR:Memory Leakage */
	int *p1 = NULL;
	int *p2 = NULL;
	if(ptr !=NULL)
	{
	   p1 = ptr;
	   p2 = p1;
	   *(p2+4) = 1;
	   free (ptr);
	}
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity:Memory Leakage main function
*/

int main ()
{
	memory_leak_0010_good();
	memory_leak_0010_bad();
	return 0;
}
