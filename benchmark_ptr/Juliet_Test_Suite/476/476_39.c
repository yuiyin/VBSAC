// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
 /*
 * @description
 * CWE: 476 Null Pointer Dereference
 */
#include "476.h"


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

void bad39()
{
    long * data;
    if(GLOBAL_CONST_TRUE)
    {
        /* POTENTIAL FLAW: Set data to NULL */
        data = NULL;
    }
    if(GLOBAL_CONST_TRUE)
    {
        /* POTENTIAL FLAW: Attempt to use data, which may be NULL */
        printLongLine(*data);
    }
}

#endif /* OMITBAD */

#ifndef OMITGOOD

void good39()
{
    long * data;
    if(GLOBAL_CONST_TRUE)
    {
        /* POTENTIAL FLAW: Set data to NULL */
        data = NULL;
    }
    if(GLOBAL_CONST_FALSE)
    {
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        printLine("Benign, fixed string");
    }
    else
    {
        /* FIX: Check for NULL before attempting to print data */
        if (data != NULL)
        {
            printLongLine(*data);
        }
        else
        {
            printLine("data is NULL");
        }
    }
}

#endif /* OMITGOOD */

int main(){
    good39();
	bad39();
    return 1;
}