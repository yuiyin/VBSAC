// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * @description
 * CWE: 191 Integer Underflow
 */

#include "191.h"

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

void printUnsignedLine(unsigned unsignedNumber) 
{
    printf("%u\n", unsignedNumber);
}


/* The two variables below are declared "const", so a tool should
   be able to identify that reads of these will always return their
   initialized values. */
static const int STATIC_CONST_TRUE = 1; /* true */
static const int STATIC_CONST_FALSE = 0; /* false */

void bad4()
{
    int64_t data;
    data = 0L;
    if(STATIC_CONST_TRUE)
    {
        /* POTENTIAL FLAW: Use the minimum size of the data type */
        data = LONG_MIN;
    }
    if(STATIC_CONST_TRUE)
    {
        {
            /* POTENTIAL FLAW: Subtracting 1 from data could cause an underflow */
            int64_t result = data - 1;
            printLongLine(result);
        }
    }
}

void good4()
{
    int64_t data;
    data = 0L;
    if(STATIC_CONST_TRUE)
    {
        /* POTENTIAL FLAW: Use the minimum size of the data type */
        data = LONG_MIN;
    }
    if(STATIC_CONST_FALSE)
    {
        /* INCIDENTAL: CWE 561 Dead Code, the code below will never run */
        printLine("Benign, fixed string");
    }
    else
    {
        /* FIX: Add a check to prevent an underflow from occurring */
        if (data > LONG_MIN)
        {
            int64_t result = data - 1;
            printLongLine(result);
        }
        else
        {
            printLine("data value is too small to perform subtraction.");
        }
    }
}

int main(){
    good4();
	bad4();
    return 1;
}