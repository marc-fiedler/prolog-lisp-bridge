#include "SWI-Prolog.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>


int main(int argc, char **argv)
{
#ifdef READLINE /* Remove if you don't want readline */
  PL_initialise_hook(install_readline);
#endif

  if ( !PL_initialise(argc, argv) )
    PL_halt(1);

	printf("Test Complete");

  PL_halt(PL_toplevel() ? 0 : 1);
}

int multiply(int x){
	return x*2;
}
