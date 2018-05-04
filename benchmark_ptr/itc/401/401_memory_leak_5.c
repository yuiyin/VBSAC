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
 *  When using pointer to float Memory is allocated and freed in conditional statement(if)
 */
void memory_leak_005_bad()
{
	float *ptr;
	int flag=10;

	if(flag > 0)
	{
		ptr= (float*) malloc(5*sizeof(float));/*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
		if(ptr!=NULL)
		{
        *(ptr+1) = 10.5;
		}
	}
    if(flag < 0)
	free(ptr);
}

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
 *  When using pointer to float Memory is allocated and freed in conditional statement(if)
 */
void memory_leak_005_good()
{
	float *ptr;
	int flag=10;

	if(flag > 0)
	{
		ptr= (float*) malloc(5*sizeof(float)); /*Tool should not detect  this line as error*/ /*No ERROR:Memory Leakage */
		if(ptr!=NULL)
		{
			*(ptr+1) = 10.5;
			free(ptr);
		}
	}
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity:Memory Leakage main function
*/

int main ()
{
	memory_leak_005_good();
	memory_leak_005_bad();
	return 0;
}
