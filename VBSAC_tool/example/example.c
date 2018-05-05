#include <stdio.h>
#include <stdlib.h>

int inputInt();

void callFree(int *p){
	free(p);
}

int main(int argc, char const *argv[])
{
	int x = 0, y = 2048, index = 0;
	int *p, *q;
	// input x
	x = inputInt();
	p = malloc(5*sizeof(int));
	if (y%x == 0) {// divide by zero
	  // error processing
	} else{
	  q = p;
	  for(index = 0; index < 5; index++) {
        *(q+index) = index+1; // null pointer dereference
    }
    if(*p < 10)
  	  callFree(q);
  	  free(p); // double free
	}
	return 1; // memory leak
}