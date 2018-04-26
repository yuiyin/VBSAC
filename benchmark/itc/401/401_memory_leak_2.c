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
 * When using double pointers to the type INT
 */
void memory_leak_002_bad()
{
	int **ptr = (int**) malloc(2*sizeof(int*)); 
	if (ptr == NULL) return;
	int i,j;

	for(i=0;i<2;i++){
		ptr[i]=(int*) malloc(1*sizeof(int)); /*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
		if (ptr[i] == NULL) return;
	}
	int index = 2;
	for(i=0;i<index;i++)
	{
		if (ptr[i] == NULL)
		{
			continue;
		}
		for(j=0;j<1;j++)
		{
			*(*(ptr+i)+j)=i;
		}
	}
	free(ptr);
}

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
 * When using double pointers to the type INT
 */
void memory_leak_002_good()
{
	int **ptr = (int**) malloc(2*sizeof(int*));
	if (ptr == NULL) return;
	int i,j;

	for(i=0;i<2;i++){
		ptr[i]=(int*) malloc(1*sizeof(int)); /*Tool should not detect this line as error*/ /*ERROR:Memory Leakage */
		if (ptr[i] == NULL) {
			for (j = 0; j < i; ++j)
			{
				free(ptr[j]);
			}
			free(ptr);
			return;
		}
	}
	int index = 2;
	for(i=0;i<index;i++)
	{
		for(j=0;j<1;j++)
		{
			*(*(ptr+i)+j)=i;
		}
	    free(ptr[i]);
	}
	free(ptr);
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity:Memory Leakage main function
*/

int main ()
{
	memory_leak_002_good();
	memory_leak_002_bad();
	return 0;
}
