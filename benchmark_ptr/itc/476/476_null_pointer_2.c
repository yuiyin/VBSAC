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
 * Complexity: Assign a Constant value to NULL double pointer
 */
void null_pointer_002_bad()
{
	int *p = NULL;
	int ret;
	ret = *p;/*Tool should detect this line as error*/ /*ERROR:NULL pointer dereference*/

}

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: 1 single pointer	Constant	 expressions	Loading
 */
void null_pointer_002_good()
{
	int buf[5] = {1, 2, 3, 4, 5};
	int *p = buf;
	int ret;
	ret = *p; /*Tool should not detect this line as error*/ /*NO ERROR:NULL pointer dereference*/

}

/*
 *Types of defects: NULL pointer dereference (access)
 *Complexity: Volatile
 */

int main ()
{
	null_pointer_002_good();
	null_pointer_002_bad();
	return 0;
}
