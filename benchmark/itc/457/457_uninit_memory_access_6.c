// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include <string.h>

/*
* Types of defects: Uninitialized Memory Access
* Complexity: Structure passed as function parameter and initialized partially in another function using mem set
*/
#define MAX 10
typedef struct {
    int arr[MAX];
    int a;
    int b;
    int c;
} uninit_memory_access_007_s_001;

void uninit_memory_access_007_func_001_bad(uninit_memory_access_007_s_001* st)
{
    /*memset(st, 0, sizeof(*st));*/
     memset(st->arr, 0, 1);
    st->a = 1;
}
void uninit_memory_access_007_func_002_bad(uninit_memory_access_007_s_001 *st)
{
    int temp=0;
    int i;
    for (i = 0; i < MAX; i++)
    {
        temp += st->arr[i];/*Tool should detect this line as error*/ /*ERROR:Uninitialized Memory Access*/
    }
}

void uninit_memory_access_007_func_003_bad(uninit_memory_access_007_s_001 *st)
{
    st->b = 10;
	st->c =20;
}

void uninit_memory_access_007_func_004_bad(int num)
{
    int temp;
    if(num != 0) {
        temp = num;
    }
}
void uninit_memory_access_007_bad()
{
	uninit_memory_access_007_s_001 st;
	uninit_memory_access_007_func_001_bad(&st);
	uninit_memory_access_007_func_002_bad(&st);
	uninit_memory_access_007_func_003_bad(&st);
	uninit_memory_access_007_func_004_bad(st.a);
}

/*
* Types of defects: Uninitialized Memory Access
* Complexity: Structure passed as function parameter and initialized partially in another function using mem set
*/

void uninit_memory_access_007_func_001_good(uninit_memory_access_007_s_001* st)
{
    memset(st, 0, sizeof(*st));
    /* memset(st->arr, 0, sizeof(st->arr[0]) * (MAX-1));*/
    st->a = 1;
}
void uninit_memory_access_007_func_002_good(uninit_memory_access_007_s_001 *st)
{
    int temp=0;
    int i;
    for (i = 0; i < MAX; i++)
    {
        temp += st->arr[i];
    }
}

void uninit_memory_access_007_func_003_good(uninit_memory_access_007_s_001 *st)
{
    st->b = 10;
	st->c =20;
}

void uninit_memory_access_007_func_004_good(int num)
{
  int temp = 0;
    if(num != 0) {
        temp = num;
    }

}
void uninit_memory_access_007_good()
{
	uninit_memory_access_007_s_001 st;
	uninit_memory_access_007_func_001_good(&st);
	uninit_memory_access_007_func_002_good(&st);
	uninit_memory_access_007_func_003_good(&st);
	uninit_memory_access_007_func_004_good(st.a);
}

int main () {
  uninit_memory_access_007_good();
	uninit_memory_access_007_bad();
	return 0;
}
