// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * @description
 * CWE: 401 Memory Leak
 */

#include "401.h"

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

#ifndef OMITBAD

void bad17()
{
    char * data;
    data = NULL;
    if(1)
    {
        /* POTENTIAL FLAW: Allocate memory on the heap */
        data = (char *)malloc(100*sizeof(char));
        if (data == NULL) return;
        /* Initialize and make use of data */
        strcpy(data, "A String");
        printLine(data);
    }
    if(1)
    {
        /* POTENTIAL FLAW: No deallocation */
        ; /* empty statement needed for some flow variants */
    }
}

#endif /* OMITBAD */

#ifndef OMITGOOD

void good17(){
    char * data;
    data = NULL;
    if(1)
    {
        /* POTENTIAL FLAW: Allocate memory on the heap */
        data = (char *)malloc(100*sizeof(char));
        if (data == NULL) return;
        /* Initialize and make use of data */
        strcpy(data, "A String");
        printLine(data);
    }
    if(0)
    {
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        printLine("Benign, fixed string");
    }
    else
    {
        /* FIX: Deallocate memory */
        free(data);
    }
}


#endif /* OMITGOOD */

int main(){
    good17();
	bad17();
    return 1;
}