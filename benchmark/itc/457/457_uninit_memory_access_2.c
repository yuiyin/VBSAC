// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include <stdlib.h>
#include <string.h>

/*
* Types of defects: Uninitialized Memory Access
* Complexity: When using a char pointer and strcpy
*/
void uninit_memory_access_003_bad()
{
	char *str1 = (char *) calloc(25,sizeof(char));
	char *str2 ;
	if (str1!=NULL)
	{
		strcpy(str1, str2);
        free(str1);
	}
}

/*
* Types of defects: Uninitialized Memory Access
* Complexity: When using a char pointer and strcpy
*/
void uninit_memory_access_003_good()
{
	char *str1 = (char *) calloc(25,sizeof(char));
	char *str2 = "THIS IS STRING";
	if (str1!=NULL)
	{
		strcpy(str1, str2);
        free(str1);
	}
}

int main () {
	uninit_memory_access_003_good();
	uninit_memory_access_003_bad();
	return 0;
}
