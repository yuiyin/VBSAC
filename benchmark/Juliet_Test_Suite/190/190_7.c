// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * @description
 * CWE: 190 Integer Overflow
 */

#include "190.h"

static int staticFive = 5;

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


void bad7()
{
    char data;
    data = ' ';
    if(staticFive==5)
    {
        /* POTENTIAL FLAW: Use a random value */
        data = (char)rand();
        if (data < 0)
        {
            data = -data;
        }
        printHexCharLine(data);
    }
    if(staticFive==5)
    {
        {
            /* POTENTIAL FLAW: Adding 1 to data could cause an overflow */
            char result = data + 1;
            printHexCharLine(result);
        }
    }
}

void good7()
{
    char data;
    data = ' ';
    if(staticFive==5)
    {
        /* POTENTIAL FLAW: Use a random value */
        data = (char)rand();
        if (data < 0)
        {
            data = -data;
        }
        printHexCharLine(data);
    }
    if(staticFive!=5)
    {
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        printLine("Benign, fixed string");
    }
    else
    {
        /* FIX: Add a check to prevent an overflow from occurring */
        if (data < CHAR_MAX)
        {
            char result = data + 1;
            printHexCharLine(result);
        }
        else
        {
            printLine("data value is too large to perform arithmetic safely.");
        }
    }
}


int main(){
    good7();
    bad7();
    return 1;
}