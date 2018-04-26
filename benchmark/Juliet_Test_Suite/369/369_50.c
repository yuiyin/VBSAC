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

static int CWE369_Divide_by_Zero__int_fscanf_divide_45_badData;
static int CWE369_Divide_by_Zero__int_fscanf_divide_45_goodG2BData;
static int CWE369_Divide_by_Zero__int_fscanf_divide_45_goodB2GData;

#ifndef OMITBAD

static void badSink()
{
    int data = CWE369_Divide_by_Zero__int_fscanf_divide_45_badData;
    /* POTENTIAL FLAW: Possibly divide by zero */
    printIntLine(100 % data);
}

void bad50()
{
    int data;
    /* Initialize data */
    data = -1;
    /* POTENTIAL FLAW: Read data from the console using fscanf() */
    fscanf(stdin, "%d", &data);
    CWE369_Divide_by_Zero__int_fscanf_divide_45_badData = data;
    badSink();
}

#endif /* OMITBAD */

#ifndef OMITGOOD
static void goodG2BSink()
{
    int data = CWE369_Divide_by_Zero__int_fscanf_divide_45_goodG2BData;
    /* POTENTIAL FLAW: Possibly divide by zero */
    printIntLine(100 % data);
}

static void good50()
{
    int data;
    /* Initialize data */
    data = -1;
    /* FIX: Use a value not equal to zero */
    data = 7;
    CWE369_Divide_by_Zero__int_fscanf_divide_45_goodG2BData = data;
    goodG2BSink();
}

#endif /* OMITGOOD */

int main(){
    good50();
    bad50();
    return 1;
}