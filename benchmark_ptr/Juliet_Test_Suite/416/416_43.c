// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
 /*
 * @description
 * CWE: 416 Use After Free
 */

#include "416.h"

const int GLOBAL_CONST_TRUE = 1; /* true */
const int GLOBAL_CONST_FALSE = 0; /* false */
const int GLOBAL_CONST_FIVE = 5; 

int globalTrue = 1; /* true */
int globalFalse = 0; /* false */
int globalFive = 5; 

int globalReturnsTrue() 
{
    return 1;
}

int globalReturnsFalse() 
{
    return 0;
}

int globalReturnsTrueOrFalse() 
{
    return (rand() % 2);
}

void printHexCharLine (char charHex)
{
    printf("%d\n", (int)charHex);
}

void printLine (const char * line)
{
    if(line != NULL) 
    {
        printf("%s\n", line);
    }
}

void printIntLine (int intNumber)
{
    printf("%d\n", intNumber);
}

void printLongLine (int64_t longIntNumber)
{
    printf("%ld\n", longIntNumber);
}


#ifndef OMITBAD

void bad43()
{
    int i;
    int * data;
    /* Initialize data */
    data = NULL;
    for(i = 0; i < 1; i++)
    {
        data = (int *)malloc(10*sizeof(int));
        if (data == NULL) return;
        {
            size_t i;
            for(i = 0; i < 10; i++)
            {
                data[i] = 5;
            }
        }
        /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
        free(data);
    }

        /* POTENTIAL FLAW: Use of data that may have been freed */
        printIntLine(data[0]);
        /* POTENTIAL INCIDENTAL - Possible memory leak here if data was not freed */
    
}

#endif /* OMITBAD */

#ifndef OMITGOOD

void good43()
{
    int i,j;
    int * data;
    /* Initialize data */
    data = NULL;
    for(i = 0; i < 1; i++)
    {
        data = (int *)malloc(10*sizeof(int));
        if (data == NULL) return;
        {
            size_t i;
            for(i = 0; i < 10; i++)
            {
                data[i] = 5;
            }
        }
        /* POTENTIAL FLAW: Free data in the source - the bad sink attempts to use data */
        free(data);
    }
}
#endif /* OMITGOOD */

int main(){
    good43();
	bad43();
    return 1;
}