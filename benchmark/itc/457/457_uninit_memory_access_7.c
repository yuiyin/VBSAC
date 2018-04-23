// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include <stdlib.h>

/*
* Types of defects: Uninitialized Memory Access
* Complexity: When using a pointer to ( signed) bit field variable ,initialized by return value of function
*/
typedef struct {
	signed int a : 7;
	signed int b : 7;
} uninit_memory_access_008_s_001;

uninit_memory_access_008_s_001 * uninit_memory_access_008_func_001_bad()
{
	uninit_memory_access_008_s_001 *ret = (uninit_memory_access_008_s_001 *) malloc (5*sizeof(uninit_memory_access_008_s_001));
	return ret;
}

void uninit_memory_access_008_bad()
{
	uninit_memory_access_008_s_001 *s = NULL;
	s = uninit_memory_access_008_func_001_bad();
	s->b = s->a;/*Tool should detect this line as error*/ /*ERROR:Uninitialized Memory Access*/
}

/*
* Types of defects: Uninitialized Memory Access
* Complexity: When using a pointer to ( signed) bit field variable ,initialized by return value of function
*/

uninit_memory_access_008_s_001 * uninit_memory_access_008_func_001_good()
{
	uninit_memory_access_008_s_001 *ret = (uninit_memory_access_008_s_001 *) malloc (5*sizeof(uninit_memory_access_008_s_001));
	if (ret!=NULL)
	{
		ret->a = 0x0f;
		ret->b = 0x0f;
	}
	return ret;
}

void uninit_memory_access_008_good()
{
	uninit_memory_access_008_s_001 *s = NULL;
	s = uninit_memory_access_008_func_001_good();
	if(s!=NULL)
	{
		s->b = (s->a)+10; /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Memory Access*/
		free (s);
	}
}

int main () {
	uninit_memory_access_008_good();
	uninit_memory_access_008_bad();
	return 0;
}
