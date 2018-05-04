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
 * Complexity: access to the pointer NULL checking
 */
int *null_pointer_013_func_001_bad(void)
{
	return (NULL);
}

void null_pointer_013_bad()
{
	int *p;
	p = null_pointer_013_func_001_bad();
	if (p != NULL)
	{
		*p = 1;
	}
	*p = 2;/*Tool should detect this line as error*/ /*ERROR:NULL pointer dereference*/
}

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: access to the pointer NULL checking
 */
int buf_good[5];
int *null_pointer_013_func_001_good(void)
{
	return buf_good;
}

void null_pointer_013_good()
{
	int *p;
	p = null_pointer_013_func_001_good();
	if (p != NULL)
	{
		*p = 1; /*Tool should not detect this line as error*/ /*NO ERROR:NULL pointer dereference*/
	}
}

/*
 *Types of defects: NULL pointer dereference (access)
 *Complexity: Volatile
 */

int main ()
{
	null_pointer_013_good();
	null_pointer_013_bad();
	return 0;
}
