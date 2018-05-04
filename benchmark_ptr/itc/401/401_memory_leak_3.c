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

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
 *  Memory allocated in a function and Memory used in another function
 */
void memory_leak_003_func_001_bad(int len,char **stringPtr)
{
	char * p = malloc(sizeof(char) * (len+1));
	if (p == NULL)
	{
		return;
	}
	*stringPtr = p;
}

void memory_leak_003_bad()
{
	char *str = "This is a string";
	char *str1;
	memory_leak_003_func_001_bad(strlen(str),&str1);/*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
	strcpy(str1,str);
}

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
 *  Memory allocated in a function and Memory used in another function
 */
void memory_leak_003_func_001_good(int len,char **stringPtr)
{
	char * p = malloc(sizeof(char) * (len+1));
	if (p == NULL)
	{
		return;
	}
	*stringPtr = p;
}

void memory_leak_003_good()
{
	char *str = "This is a string";
	char *str1;
	memory_leak_003_func_001_good(strlen(str),&str1); /*Tool should not detect  this line as error*/ /*No ERROR:Memory Leakage */
	strcpy(str1,str);
	free(str1);
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity:Memory Leakage main function
*/

int main ()
{
	memory_leak_003_good();
	memory_leak_003_bad();
	return 0;
}
