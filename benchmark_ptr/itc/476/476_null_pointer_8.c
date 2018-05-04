// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
* Defect Classification
* ---------------------
* Defect Type: Pointer related defects
* Defect Sub-type: Dereferencing a NULL pointer
*
*/

#include <string.h>

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: single pointer The return value of the function	expressions	Write
 */
int* null_pointer_008_func_001_bad()
{
	return NULL;
}

void null_pointer_008_bad()
{
	int *p;
	p = null_pointer_008_func_001_bad();
	*p = 1;/*Tool should detect this line as error*/ /*ERROR:NULL pointer dereference*/
}

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: 1 single pointer	The return value of the function	expressions	Write
 */
int null_pointer_008_glb_001_good[5];

int* null_pointer_008_func_001_good()
{
	return null_pointer_008_glb_001_good;
}

void null_pointer_008_good()
{
	int *p;
	p = null_pointer_008_func_001_good();
	*p = 1; /*Tool should not detect this line as error*/ /*NO ERROR:NULL pointer dereference*/
}

/*
 *Types of defects: NULL pointer dereference (access)
 *Complexity: Volatile
 */

int main ()
{
	null_pointer_008_good();
	null_pointer_008_bad();
	return 0;
}
