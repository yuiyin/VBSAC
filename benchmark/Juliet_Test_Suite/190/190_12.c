// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * @description
 * CWE: 190 Integer Overflow
 */

#include "190.h"

const int GLOBAL_CONST_TRUE = 1; /* true */
const int GLOBAL_CONST_FALSE = 0; /* false */
const int GLOBAL_CONST_FIVE = 5; 

int globalTrue = 1; /* true */
int globalFalse = 0; /* false */
int globalFive = 5; 

/* The two functions always return 1 or 0, so a tool should be able to 
   identify that uses of these functions will always return these values */
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


void bad12()
{
    int64_t data;
    data = 0LL;
    if(globalReturnsTrueOrFalse())
    {
        /* POTENTIAL FLAW: Use a value input from the console */
        fscanf (stdin, "%ld", &data);
    }
    else
    {
        /* FIX: Use a small, non-zero value that will not cause an overflow in the sinks */
        data = 2;
    }
    if(globalReturnsTrueOrFalse())
    {
        {
            /* POTENTIAL FLAW: if (data*data) > LLONG_MAX, this will overflow */
            int64_t result = data * data;
            printLongLine(result);
        }
    }
    else
    {
        /* FIX: Add a check to prevent an overflow from occurring */
        if (labs((long)data) <= (long)sqrt((double)LLONG_MAX))
        {
            int64_t result = data * data;
            printLongLine(result);
        }
        else
        {
            printLine("data value is too large to perform arithmetic safely.");
        }
    }
}

void good12()
{
    int64_t data;
    data = 0LL;
    if(globalReturnsTrueOrFalse())
    {
        /* POTENTIAL FLAW: Use a value input from the console */
        fscanf (stdin, "%ld", &data);
    }
    else
    {
        /* POTENTIAL FLAW: Use a value input from the console */
        fscanf (stdin, "%ld", &data);
    }
    if(globalReturnsTrueOrFalse())
    {
        /* FIX: Add a check to prevent an overflow from occurring */
        if (labs((long)data) <= (long)sqrt((double)LLONG_MAX))
        {
            int64_t result = data * data;
            printLongLine(result);
        }
        else
        {
            printLine("data value is too large to perform arithmetic safely.");
        }
    }
    else
    {
        /* FIX: Add a check to prevent an overflow from occurring */
        if (labs((long)data) <= (long)sqrt((double)LLONG_MAX))
        {
            int64_t result = data * data;
            printLongLine(result);
        }
        else
        {
            printLine("data value is too large to perform arithmetic safely.");
        }
    }
}

int main(){
    good12();
    bad12();
    return 1;
}
