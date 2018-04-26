// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
 * @description
 * CWE: 190 Integer Overflow
 * Feature:
 * 1. type: short
 * 2. generator: fscanf
 * 3. arithmatic: mul
 * 4. program structure: array
 */

#include "190.h"

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


void badSink(short dataArray[])
{
    /* copy data out of dataArray */
    short data = dataArray[2];
    if(data > 0) /* ensure we won't have an underflow */
    {
        /* POTENTIAL FLAW: if (data*2) > SHRT_MAX, this will overflow */
        short result = data * 2;
        printIntLine(result);
    }
}

void goodSink(short dataArray[])
{
    short data = dataArray[2];
    data = 2;
    if(data > 0) /* ensure we won't have an underflow */
    {
        /* POTENTIAL FLAW: if (data*2) > SHRT_MAX, this will overflow */
        short result = data * 2;
        printIntLine(result);
    }
}

void bad26()
{
    short data;
    short dataArray[5];
    data = 0;
    /* POTENTIAL FLAW: Use a value input from the console */
    fscanf (stdin, "%hd", &data);
    /* put data in array */
    dataArray[2] = data;
    badSink(dataArray);
}

void good26()
{
    short data;
    short dataArray[5];
    data = 0;
    /* POTENTIAL FLAW: Use a value input from the console */
    fscanf (stdin, "%hd", &data);
    dataArray[2] = data;
    goodSink(dataArray);
}

int main(){
    good26();
    bad26();
    return 1;
}