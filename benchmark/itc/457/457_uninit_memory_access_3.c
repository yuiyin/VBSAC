// This is an open source non-commercial project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/*
* Types of defects: Uninitialized Memory Access
*/
enum {max_buffer = 24};

void _001_bad(const char *msg) {
  const char *error_log = msg;
  char buffer[max_buffer];

}
void bad()
{
	char *str ;
	_001_bad(str);/*Tool should detect this line as error*/ /*ERROR:Uninitialized Memory Access*/
}

/*
* Types of defects: Uninitialized Memory Access
*/
void _001_good(const char *msg) {
  const char *error_log = msg;
  char buffer[max_buffer];

}
void good()
{
	char *str = "STRING";
	_001_good(str); /*Tool should not detect this line as error*/ /*No ERROR:Uninitialized Memory Access*/
}

int main () {
  good();
	bad();
	return 0;
}
