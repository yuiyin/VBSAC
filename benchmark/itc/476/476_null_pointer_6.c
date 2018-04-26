// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
* Defect Classification
* ---------------------
* Defect Type: Pointer related defects
* Defect Sub-type: Dereferencing a NULL pointer
*
*/

#include <stdint.h>
#include <math.h>
int rand (void);

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: Assign a Value of random variable to NULL single pointer
 */
void null_pointer_006_bad()
{
	int *p;
	p = (int *)(intptr_t)rand();
	*p = 1;/*Tool should detect this line as error*/ /*ERROR:NULL pointer dereference*/
}

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: 1 single pointer	Value of random variable	 expressions	Write
 */
void null_pointer_006_good()
{
	int a = 20;
	int *p;
	p = &a;
	*p = 1; /*Tool should not detect this line as error*/ /*NO ERROR:NULL pointer dereference*/
}

/*
 *Types of defects: NULL pointer dereference (access)
 *Complexity: Volatile
 */

int main ()
{
	null_pointer_006_good();
	null_pointer_006_bad();
	return 0;
}
