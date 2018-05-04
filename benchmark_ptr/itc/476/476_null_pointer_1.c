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
 * Complexity: Assign a Constant value to NULL single pointer
 */
void null_pointer_001_bad()
{
	int *p = NULL;
	*p = 1; /*Tool should detect this line as error*/ /*ERROR:NULL pointer dereference*/
}

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: 1 single pointer	Constant	 expressions	Write
 */
void null_pointer_001_good()
{
	int buf[5];
	int *p = buf;
	*p = 1; /*Tool should not detect this line as error*/ /*NO ERROR:NULL pointer dereference*/
}

/*
 *Types of defects: NULL pointer dereference (access)
 *Complexity: Volatile
 */

int main ()
{
	null_pointer_001_good();
	null_pointer_001_bad();
	return 0;
}
