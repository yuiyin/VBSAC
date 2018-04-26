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
*  When using 1 single pointer alias - dangling pointer
*/
void memory_leak_009_bad()
{
	float *ptr=(float*) malloc(5 * sizeof(float));
	float *p = (float*) malloc(5 * sizeof(float)); /*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
	if(ptr !=NULL)
	{
          p = (float *)ptr;
	   *(p+1) = 1;
	   free (ptr);
	   ptr = NULL;
	}
}

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
*  When using 1 single pointer alias  - pointing to different type
*/
void memory_leak_009_good()
{
	float *ptr=(float*) malloc(5 * sizeof(float)); /*Tool should not detect  this line as error*/ /*No ERROR:Memory Leakage */
	float *p = NULL ;
	if(ptr !=NULL)
	{
	   p = ptr;
	   *(p+1) = 1.5;
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
	memory_leak_009_good();
	memory_leak_009_bad();
	return 0;
}
