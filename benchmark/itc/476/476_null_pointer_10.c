// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/********Software Analysis - FY2013*************/
/*
* File Name: null_pointer.c
* Defect Classification
* ---------------------
* Defect Type: Pointer related defects
* Defect Sub-type: Dereferencing a NULL pointer
*
*/

#include <string.h>

/*
 * Defect types : pointer reference (access)
 * Complexity: single pointer  1 alias 	expressions	Write
 */
void null_pointer_010_bad()
{
	int *p = NULL;
	int *p1;
	p1 = p;
	*p1 = 1;/*Tool should detect this line as error*/ /*ERROR:NULL pointer dereference*/
}

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: 1 single pointer	Alias for 1 weight	 expressions	Write
 */
void null_pointer_010_good()
{
	int buf[5];
	int *p = buf;
	int *p1;
	p1 = p;
	*p1 = 1; /*Tool should not detect this line as error*/ /*NO ERROR:NULL pointer dereference*/
}

/*
 *Types of defects: NULL pointer dereference (access)
 *Complexity: Volatile
 */

int main ()
{
	null_pointer_010_good();
	null_pointer_010_bad();
	return 0;
}
