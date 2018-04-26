// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * @description
 * CWE: 369 Divide by Zero
 */

#include "369.h"

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
static const int STATIC_CONST_FIVE = 5;

/* The two variables below are declared "const", so a tool should
   be able to identify that reads of these will always return their
   initialized values. */
static const int STATIC_CONST_TRUE = 1; /* true */
static const int STATIC_CONST_FALSE = 0; /* false */

#ifndef OMITBAD

void bad31()
{
    int data;
    /* Initialize data */
    data = -1;
    if(STATIC_CONST_FIVE==5)
    {
        /* POTENTIAL FLAW: Read data from the console using fscanf() */
        fscanf(stdin, "%d", &data);
    }
    if(STATIC_CONST_FIVE==5)
    {
        /* POTENTIAL FLAW: Possibly divide by zero */
        printIntLine(100 % data);
    }
}

#endif /* OMITBAD */

#ifndef OMITGOOD

void good31()
{
    int data;
    /* Initialize data */
    data = -1;
    if(STATIC_CONST_FIVE==5)
    {
        /* FIX: Use a value not equal to zero */
        data = 7;
    }
    if(STATIC_CONST_FIVE==5)
    {
        /* POTENTIAL FLAW: Possibly divide by zero */
        printIntLine(100 % data);
    }
}

#endif /* OMITGOOD */
int main(){
    good31();
    bad31();
    return 1;
}