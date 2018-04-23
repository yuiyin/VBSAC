#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <math.h>
#include <stdint.h>

typedef struct _twoIntsStruct
{
    int intOne;
    int intTwo;
} twoIntsStruct;

/* The variables below are declared "const", so a tool should
   be able to identify that reads of these will always return their 
   initialized values. */
extern const int GLOBAL_CONST_TRUE; /* true */
extern const int GLOBAL_CONST_FALSE; /* false */
extern const int GLOBAL_CONST_FIVE; /* 5 */

/* The variables below are not defined as "const", but are never
   assigned any other value, so a tool should be able to identify that
   reads of these will always return their initialized values. */
extern int globalTrue; /* true */
extern int globalFalse; /* false */
extern int globalFive; /* 5 */

int globalReturnsTrue();

int globalReturnsFalse();

int globalReturnsTrueOrFalse();

void printHexCharLine(char charHex);

void printLine(const char * line);

void printIntLine (int intNumber);

void printLongLine(int64_t longIntNumber);

