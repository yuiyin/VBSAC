// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * @description
 * CWE: 369 Divide by Zero
 */

#include "369.h"

const int GLOBAL_CONST_TRUE = 1; /* true */
const int GLOBAL_CONST_FALSE = 0; /* false */
const int GLOBAL_CONST_FIVE = 5; 


int globalTrue = 1; /* true */
int globalFalse = 0; /* false */
int globalFive = 5; 

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

int globalReturnsTrueOrFalse() 
{
    return (rand() % 2);
}

#ifndef OMITBAD

void bad16()
{
    int data;
    /* Initialize data */
    data = -1;
    while(1)
    {
        /* POTENTIAL FLAW: Read data from the console using fscanf() */
        fscanf(stdin, "%d", &data);
        break;
    }
    while(1)
    {
        /* POTENTIAL FLAW: Possibly divide by zero */
        printIntLine(100 / data);
        break;
    }
}

#endif /* OMITBAD */

void good16()
{
    int data;
    /* Initialize data */
    data = -1;
    while(1)
    {
        /* POTENTIAL FLAW: Read data from the console using fscanf() */
        fscanf(stdin, "%d", &data);
        break;
    }
    while(1)
    {
        /* FIX: test for a zero denominator */
        if( data != 0 )
        {
            printIntLine(100 / data);
        }
        else
        {
            printLine("This would result in a divide by zero");
        }
        break;
    }
}


int main(){
	good16();
    bad16();
    return 1;
}