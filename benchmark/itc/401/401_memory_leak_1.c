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
* Complexity: When using a pointer to char in an infinite for loop
*/
void memory_leak_001_bad()
{
	int i;
	char *buf;
	for (i=0;i < 1;i++)
	{
		buf=(char*) calloc(5,sizeof(char)); /*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
		if(buf!=NULL)
		{
			buf[0]=1;
		}
	}
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity: When using a pointer to char in an infinite for loop
*/
void memory_leak_001_good()
{
	int i;
	char *buf;
	for (i=0; i< 1;i++)
	{
		buf=(char*) calloc(5,sizeof(char)); /*Tool should not detect  this line as error*/ /*No ERROR:Memory Leakage */
		if(buf!=NULL)
		{
			*(buf+1)=1;
		    free (buf);
		}
	}
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity:Memory Leakage main function
*/

int main ()
{
	memory_leak_001_good();
	memory_leak_001_bad();
	return 0;
}
