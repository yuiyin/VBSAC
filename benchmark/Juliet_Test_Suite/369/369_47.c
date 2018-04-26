// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * @description
 * CWE: 369 Divide by Zero
 */

#include "369.h"

typedef union
{
    int unionFirst;
    int unionSecond;
} CWE369_Divide_by_Zero__int_fscanf_divide_34_unionType;


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

void bad47()
{
    int data;
    CWE369_Divide_by_Zero__int_fscanf_divide_34_unionType myUnion;
    /* Initialize data */
    data = -1;
    /* POTENTIAL FLAW: Read data from the console using fscanf() */
    fscanf(stdin, "%d", &data);
    myUnion.unionFirst = data;
    {
        int data = myUnion.unionSecond;
        /* POTENTIAL FLAW: Possibly divide by zero */
        printIntLine(100 % data);
    }
}

#endif /* OMITBAD */

#ifndef OMITGOOD

void good47()
{
    int data;
    CWE369_Divide_by_Zero__int_fscanf_divide_34_unionType myUnion;
    /* Initialize data */
    data = -1;
    /* FIX: Use a value not equal to zero */
    data = 7;
    myUnion.unionFirst = data;
    {
        int data = myUnion.unionSecond;
        /* POTENTIAL FLAW: Possibly divide by zero */
        printIntLine(100 % data);
    }
}

#endif /* OMITGOOD */

int main(){
    good47();
    bad47();
    return 1;
}