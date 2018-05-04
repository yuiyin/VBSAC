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
 * Complexity: Assign a Constant value to NULL struct pointer
 */
typedef struct {
	int a;
	int b;
	int c;
} null_pointer_004_s_001;

void null_pointer_004_bad()
{
	null_pointer_004_s_001 *p = NULL;
	p->a = 1;/*Tool should detect this line as error*/ /*ERROR:NULL pointer dereference*/
}

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: struct pointer	Constant	expressions	Write
 */

void null_pointer_004_good()
{
	null_pointer_004_s_001 s;
	null_pointer_004_s_001 *p = &s;
	p->a = 1; /*Tool should not detect this line as error*/ /*NO ERROR:NULL pointer dereference*/
}

/*
 *Types of defects: NULL pointer dereference (access)
 *Complexity: Volatile
 */

int main ()
{
	null_pointer_004_good();
	null_pointer_004_bad();
	return 0;
}
