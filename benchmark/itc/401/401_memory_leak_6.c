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
 *  When using pointer to double Memory is allocated and freed based on return value of function
 */
int memory_leak_006_func_001_bad(int flag)
{
   int ret;
   if (flag ==0)
	   ret = 0;
   else
	   ret=1;
   return ret;
}

void memory_leak_006_bad()
{
	double *dptr;
	int flag=0;

	if(memory_leak_006_func_001_bad(flag)==0)
	{
		dptr= (double*) malloc(5*sizeof(double));/*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
		if(dptr!=NULL)
		{
           *(dptr+1) = 10.50000;
		}
	}
    if(memory_leak_006_func_001_bad(flag) !=0)
	free(dptr);
}

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
 *  When using pointer to double Memory is allocated and freed based on return value of function
 */
int memory_leak_006_func_001_good(int flag)
{
   int ret;
   if (flag ==0)
	   ret = 0;
   else
	   ret=1;
   return ret;
}

void memory_leak_006_good()
{
	double *dptr;
	int flag=0;

	if(memory_leak_006_func_001_good(flag)==0)
	{
		dptr= (double*) malloc(5*sizeof(double)); /*Tool should not detect  this line as error*/ /*No ERROR:Memory Leakage */
		if(dptr!=NULL)
		{
           *(dptr+1) = 10.50000;
       	   free(dptr);
		}
	}
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity:Memory Leakage main function
*/

int main ()
{
	memory_leak_006_good();
  memory_leak_006_bad();
	return 0;
}
