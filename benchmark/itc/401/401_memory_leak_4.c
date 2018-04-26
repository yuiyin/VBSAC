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
#include <string.h>

int rand (void);

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
 * When using pointers to the structure with an string as a member of the structure
 */
typedef struct {
	int a;
	int b;
	char *buf;
} memory_leak_004_s_001;

void memory_leak_004_bad()
{
	memory_leak_004_s_001* s=(memory_leak_004_s_001*) calloc(5,sizeof(memory_leak_004_s_001)) ;
	if (s == NULL)
	{
		return;
	}
	char *s1="This is a string";
	int i;
	if(s!=NULL)
	for(i= 0; i<5 ;i++)
	{
		(s+i)->buf = (char*)malloc(25* sizeof(char));/*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
		if ((s+i)->buf == NULL)
		{
			return;
		}
	}
	strcpy((s+4)->buf,s1);
	for(i= 0; i<5 ;i++);
	free(s);
}

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
 * When using pointers to the structure with an string as a member of the structure
 */
void memory_leak_004_good()
{
	memory_leak_004_s_001* s=(memory_leak_004_s_001*) calloc(5,sizeof(memory_leak_004_s_001)) ;
	if (s == NULL)
	{
		return;
	}
	char *s1="This is a string";
	int i;
	if(s!=NULL)
	for(i= 0; i<5 ;i++)
	{
		(s+i)->buf = (char*)malloc(25* sizeof(char)); /*Tool should not detect  this line as error*/ /*No ERROR:Memory Leakage */
		if ((s+i)->buf == NULL)
		{
			for (int j = 0; j < i; ++j)
			{
				free((s+i)->buf);
			}
			free(s);
			return;
		}
	}
	strcpy((s+4)->buf,s1);
	for(i= 0; i<5 ;i++)
		free((s+i)->buf);
	free(s);
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity:Memory Leakage main function
*/

int main ()
{
	memory_leak_004_good();
	memory_leak_004_bad();
	return 0;
}
