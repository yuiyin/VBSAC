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
 * Complexity: Assign a Constant value to NULL union pointer
 */
typedef struct {
	int a;
	int b;
} null_pointer_005_s_001;

typedef struct {
	int a;
	int b;
} null_pointer_005_s_002;

typedef struct {
	int a;
	int b;
} null_pointer_005_s_003;

typedef union {
	null_pointer_005_s_001 s1;
	null_pointer_005_s_002 s2;
	null_pointer_005_s_003 s3;
} null_pointer_005_uni_001;

void null_pointer_005_bad()
{
	null_pointer_005_uni_001 *p = NULL;
	p->s1.a = 1;/*Tool should detect this line as error*/ /*ERROR:NULL pointer dereference*/
}

/*
 * Defect types : NULL pointer dereference (access)
 * Complexity: Union of pointer	Constant	 expressions	Write
 */

void null_pointer_005_good()
{
	null_pointer_005_uni_001 u;
	null_pointer_005_uni_001 *p = &u;
	p->s1.a = 1; /*Tool should not detect this line as error*/ /*NO ERROR:NULL pointer dereference*/
}

/*
 *Types of defects: NULL pointer dereference (access)
 *Complexity: Volatile
 */

int main ()
{
	null_pointer_005_good();
	null_pointer_005_bad();
	return 0;
}
