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
 * Defect types : pointer reference (access)
 * Complexity: single pointer Function arguments	expressions	Write
 */
void null_pointer_009_func_001_bad(int *p)
{
	*p = 1;/*Tool should detect this line as error*/ /*ERROR:NULL pointer dereference*/
}

void null_pointer_009_bad()
{
	null_pointer_009_func_001_bad(NULL);
}

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: 1 single pointer	Function arguments	expressions	Write
 */
void null_pointer_009_func_001_good(int *p)
{
	*p = 1; /*Tool should not detect this line as error*/ /*NO ERROR:NULL pointer dereference*/
}

void null_pointer_009_good()
{
	int buf[5];
	null_pointer_009_func_001_good(buf);
}

/*
 *Types of defects: NULL pointer dereference (access)
 *Complexity: Volatile
 */

int main ()
{
	null_pointer_009_good();
	null_pointer_009_bad();
	return 0;
}
