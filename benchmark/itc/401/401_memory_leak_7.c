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
#include <math.h>

int rand (void);

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
 *  When using Switch case statements and void pointer
 */
void *vptr_bad;
int memory_leak_007_func_001_bad(int flag)
{
	switch (flag)
	{
		case 1:
		{
			vptr_bad = (int *)calloc(10, sizeof(int));/*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
			if(vptr_bad!=NULL)
			{
			   *((int*)vptr_bad+1) = 10;
			}
			return 1;
		}
		case 2:
		{
			vptr_bad = (char *)calloc(10, sizeof(char));
			if(vptr_bad!=NULL)
			{
			   *((char*)vptr_bad+2) = 'a';
			}
			return 2;
		}
		case 3:
		{
			vptr_bad = (float *)calloc(10, sizeof(float));
			if(vptr_bad!=NULL)
			{
			   *((float*)vptr_bad+3) = 5.5;
			}
			return 3;
		}
		default:
			return -1;
	}
}

void memory_leak_007_bad()
{
	int ret;
	ret = memory_leak_007_func_001_bad(rand());
	if(ret == 0)
		if(vptr_bad!=NULL)
		{
		free(vptr_bad);
		}
}

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
 *  When using Switch case statements and void pointer
 */
void *vptr_good;
int memory_leak_007_func_001_good(int flag)
{
	switch (flag)
	{
		case 1:
		{
			vptr_good = (int *)calloc(10, sizeof(int)); /*Tool should not detect  this line as error*/ /*No ERROR:Memory Leakage */
			if(vptr_good!=NULL)
			{
			   *((int*)vptr_good+1) = 10;
			}
			return 1;
		}
		case 2:
		{
			vptr_good = (char *)calloc(10, sizeof(char));
			if(vptr_good!=NULL)
			{
			   *((char*)vptr_good+2) = 'a';
			}
			return 2;
		}
		case 3:
		{
			vptr_good = (float *)calloc(10, sizeof(float));
			if(vptr_good!=NULL)
			{
			   *((float*)vptr_good+3) = 5.5;
			}
			return 3;
		}
		default:
			return -1;
	}
}

void memory_leak_007_good()
{
	int ret;
	ret = memory_leak_007_func_001_good(rand());
	if(ret >=0 )
		if(vptr_good!=NULL)
		{
		   free(vptr_good);
		}
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity:Memory Leakage main function
*/

int main ()
{
	memory_leak_007_good();
	memory_leak_007_bad();
	return 0;
}
