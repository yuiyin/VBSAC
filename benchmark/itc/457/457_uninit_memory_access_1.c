// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
* Types of defects: Uninitialized Memory Access
* Complexity: When using unsigned long variable - stack access
*/
void uninit_memory_access_001_bad()
{
	unsigned long a;
	unsigned long *ret;
	ret = &a;
}

/*
* Types of defects: Uninitialized Memory Access
* Complexity: When using unsigned long variable - stack access
*/
void uninit_memory_access_001_good()
{
	unsigned long a = 10;
	unsigned long *ret;
	ret = &a;
}

int main () {
	uninit_memory_access_001_good();
	uninit_memory_access_001_bad();
	return 0;
}
