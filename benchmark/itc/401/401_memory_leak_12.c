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
 * Complexity: Union of pointer	Constant	 expressions	Write
 */
typedef struct {
	int a;
	int b;
} memory_leak_0012_s_001;

typedef struct {
	int a;
	int b;
} memory_leak_0012_s_002;

typedef struct {
	int a;
	int b;
} memory_leak_0012_s_003;

typedef union {
	memory_leak_0012_s_001 s1;
	memory_leak_0012_s_002 s2;
	memory_leak_0012_s_003 s3;
} memory_leak_0012_uni_001;

void memory_leak_0012_bad()
{
	memory_leak_0012_uni_001 *u = (memory_leak_0012_uni_001 * )malloc(5*sizeof( memory_leak_0012_uni_001 ));
	if (u == NULL)
	{
		return;
	}
	memory_leak_0012_uni_001 *p  = (memory_leak_0012_uni_001 * )malloc(5*sizeof( memory_leak_0012_uni_001 ));/*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
	p = u;

	p->s1.a = 1;

	free(u);
}

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
 * Complexity: Union of pointer	Constant	 expressions	Write
 */
void memory_leak_0012_good()
{
	memory_leak_0012_uni_001 *u = (memory_leak_0012_uni_001 * )malloc(5*sizeof( memory_leak_0012_uni_001 )); /*Tool should not detect  this line as error*/ /*No ERROR:Memory Leakage */
	memory_leak_0012_uni_001 *p  = NULL;
	p = u;
    if(u!=NULL)
    {
    	p->s1.a = 1;
	    free(u);
    }
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity:Memory Leakage main function
*/

int main ()
{
	memory_leak_0012_good();
	memory_leak_0012_bad();
	return 0;
}
