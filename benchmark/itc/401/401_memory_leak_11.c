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
*  When using alias(union) - a union containing two methods of accessing the same data (within the same function) alias
*/
typedef union {
    char * u1;
    char * u2;
} memory_leak_0011_uni_001;


void memory_leak_0011_bad()
{
    char * buf = NULL;
    memory_leak_0011_uni_001 un;
    buf = (char *)calloc(50, sizeof(char)); /*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
	if(buf!=NULL)
	{
    strcpy(buf, "This Is A String");
    un.u1 = buf;
	}
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
*  When using alias(union) - a union containing two methods of accessing the same data (within the same function) alias
*/
void memory_leak_0011_good()
{
    char * buf = NULL;
    memory_leak_0011_uni_001 un;
    buf = (char *)calloc(50, sizeof(char)); /*Tool should not detect  this line as error*/ /*No ERROR:Memory Leakage */
	if(buf!=NULL)
	{
          strcpy(buf, "This Is A String");
          un.u1 = buf;
          char * buf = un.u1;
          if (buf)
            free(buf);
          buf = NULL;
        }
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity:Memory Leakage main function
*/

int main ()
{
  memory_leak_0011_good();
	memory_leak_0011_bad();
	return 0;
}
