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
 * Complexity: 1 single pointer	Constant	Array form	Write
 */
void null_pointer_012_bad()
{
	int *p = NULL;
	p[3] = 1; /*Tool should detect this line as error*/ /*ERROR:NULL pointer dereference*/
}

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: 1 single pointer	Constant	Array form	Write
 */
void null_pointer_012_good()
{
	int buf[5];
	int *p = buf;
	p[3] = 1;
}

/*
 *Types of defects: NULL pointer dereference (access)
 *Complexity: Volatile
 */

int main ()
{
	null_pointer_012_good();
	null_pointer_012_bad();
	return 0;
}
