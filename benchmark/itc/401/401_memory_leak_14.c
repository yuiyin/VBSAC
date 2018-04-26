// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
* Defect Classification
* ---------------------
* Defect Type: Resource management defects
* Defect Sub-type: Memory leakage
*
*/

#include <stdlib.h>

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
*  Using two double pointers to the same value within the same function
*/
void memory_leak_0014_bad()
{
    float * fptr;
    float **fp1 = &fptr;
    float **fp2 = &fptr;
    fptr = NULL;
    {
        float * fptr = *fp1;
        fptr = (float *)calloc(10, sizeof(float));/*Tool should detect this line as error*/ /*ERROR:Memory Leakage */
        if(fptr!=NULL)
        {
        *(fptr+3) = 50.5;
        *fp1 = fptr;
        }
    }
    {
        float * fptr1 ;
        fptr1 = *fp2;
    }
}

/*
 * Types of defects: Memory Leakage - Allocate Memory and not freeing it
*  Using two double pointers to the same value within the same function
*/
void memory_leak_0014_good()
{
    float * fptr;
    float **fp1 = &fptr;
    float **fp2 = &fptr;
    fptr = NULL;
    {
        float * fptr = *fp1;
        fptr = (float *)calloc(10, sizeof(float)); /*Tool should not detect  this line as error*/ /*No ERROR:Memory Leakage */
        if(fptr!=NULL)
        {
           *(fptr+3) = 50.5;
           *fp1 = fptr;
        }
    }
    {
        float * fptr = *fp2;
        free(fptr);
    }
}

/*
* Types of defects: Memory Leakage - Allocate Memory and not freeing it
* Complexity:Memory Leakage main function
*/

int main ()
{
  memory_leak_0014_good();
	memory_leak_0014_bad();
	return 0;
}
