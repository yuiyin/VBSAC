// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include <stdlib.h>

/*
* Types of defects: Uninitialized Memory Access
* Complexity: When using a pointer to char , and initialized in another function
*/
void uninit_memory_access_006_func_001_bad(char *dst, const char *src)
{
     if(src == NULL)
     {
         return;
     }
     else
     {
    	 while(*src != '\0')
        {
    		 *dst = *src;
             src++;
             dst++;
        }
        *dst = '\0';
     }
 }
void uninit_memory_access_006_bad()
{
    char *str1 = (char *) calloc(25,sizeof(char));
    char *str2 ;
    uninit_memory_access_006_func_001_bad(str1, str2);
}

/*
* Types of defects: Uninitialized Memory Access
* Complexity: When using a pointer to char , and initialized in another function
*/
void uninit_memory_access_006_func_001_good(char *dst, const char *src)
{
     if(src == NULL)
     {
         return;
     }
     else
     {
    	 while(*src != '\0')
        {
    		 *dst = *src;
             src++;
             dst++;
        }
        *dst = '\0';
     }
 }
void uninit_memory_access_006_good()
{
    char *str1 = (char *) calloc(25,sizeof(char));
    char *str2 = "STRING";
    uninit_memory_access_006_func_001_good(str1, str2);
}

int main () {
  uninit_memory_access_006_good();
	uninit_memory_access_006_bad();
	return 0;
}
