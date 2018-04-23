// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include <stdlib.h>

long ** _bad;
/*
* Types of defects: Uninitialized Memory Access
 *  When using array of double pointer to long -  Memory is  allocated based on return value of function ,initialized and accessed
 */


void _002_bad()
{
	int i,j;
	_bad=(long**) malloc(10*sizeof(long*));

	for(i=0;i<2;i++)
	{
		_bad[i]=(long*) malloc(10*sizeof(long));
	}
	for(i=0;i<2;i++)
	{
		for(j=0;j<2;j++)
		{
			;/*uninit_memory_access_009_doubleptr_gbl_bad[i][j]=i;*/
		}
	}
}

void bad()
{
	int flag=0,i,j;

	if(flag==0)
	{
		_002_bad();
	}
    if((flag)==0)
	{
		for(i=0;i<2;i++)
		{
			for(j=0;j<2;j++)
			{
				_bad[i][j] += 1;/*Tool should detect this line as error*/ /*ERROR:Uninitialized Memory Access*/
			}
			free (_bad[i]);
			_bad[i] = NULL;
	   }
	    free(_bad);
	    _bad = NULL;
	}
}

long ** _good;
/*
* Types of defects: Uninitialized Memory Access
 *  When using array of double pointer to long -  Memory is  allocated based on return value of function ,initialized and accessed
 */

void _002_good()
{
	int i,j;
	_good=(long**) malloc(10*sizeof(long*));

	for(i=0;i<2;i++)
	{
		_good[i]=(long*) malloc(10*sizeof(long));
	}
	for(i=0;i<2;i++)
	{
		for(j=0;j<2;j++)
		{
			_good[i][j]=i;
		}
	}
}

void good()
{
	int flag=0,i,j;

	if((flag)==0)
	{
		_002_good();
	}
    if((flag)==0)
	{
		for(i=0;i<10;i++)
		{
			for(j=0;j<10;j++)
			{
				_good[i][j] += 1; /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Memory Access*/
			}
			free (_good[i]);
			_good[i] = NULL;
	   }
	    free(_good);
	    _good = NULL;
	}
}

int main () {
	good();
	bad();
	return 0;
}
