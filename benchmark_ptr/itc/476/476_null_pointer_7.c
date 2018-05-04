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

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: single pointer Linear equation expressions	Write
 */
void null_pointer_007_bad()
{
	int *p;
	int a = 3;
	p = (int *)(intptr_t)((2 * a) - 6);
	*p = 1;/*Tool should detect this line as error*/ /*ERROR:NULL pointer dereference*/
}

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: 1 single pointer	Linear equation	expressions	Write
 */
void null_pointer_007_good()
{
	int *p;
	int a = 3;
	p = &a;
	*p = 1; /*Tool should not detect this line as error*/ /*NO ERROR:NULL pointer dereference*/
}

/*
 *Types of defects: NULL pointer dereference (access)
 *Complexity: Volatile
 */

int main ()
{
	null_pointer_007_good();
	null_pointer_007_bad();
	return 0;
}
