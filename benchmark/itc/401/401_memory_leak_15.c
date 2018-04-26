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
 *  Memory allocated and returned from one function and Memory used in another function
 */
char * memory_leak_0015_func_001_bad(int len)
{
	char *stringPtr = malloc(sizeof(char) * (len+1));
	return stringPtr;
}

void memory_leak_0015_bad()
{
	char *str = "This is a string";
	char *str1 = memory_leak_0015_func_001_bad(strlen(str)); /*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
	if(str1!=NULL)
	{
	    strcpy(str1,str);
	}
}

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
 *  Memory allocated and returned from one function and Memory used in another function
 */
char * memory_leak_0015_func_001_good(int len)
{
	char *stringPtr = malloc(sizeof(char) * (len+1));
	return stringPtr;
}

void memory_leak_0015_good()
{
	char *str = "This is a string";
	char *str1 = memory_leak_0015_func_001_good(strlen(str)); /*Tool should not detect  this line as error*/ /*No ERROR:Memory Leakage */
	if(str1!=NULL)
	{
	   strcpy(str1,str);
	   free(str1);
	}
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity:Memory Leakage main function
*/

int main ()
{
	memory_leak_0015_good();
	memory_leak_0015_bad();
	return 0;
}
