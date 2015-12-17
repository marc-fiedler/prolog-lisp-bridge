/* TEST  */
#include "SWI-Prolog.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

void plus_test(int a, int b){
	char *argv[] = {"swilisp", "--quiet", NULL};
	int args = 2;
	//#ifdef READLINE /* Remove if you don't want readline */
	//	PL_initialise_hook(install_readline);
	//#endif

	if ( !PL_initialise(args, argv) ){
		PL_halt(1);
	}

	printf("Calculating a+x=b... using the plus predicate\n");

	predicate_t tmp;
	
	// ask for 3 terms
	term_t t = PL_new_term_refs(3);
	
	// define our terns (example is plus(2,x,5) // 2+x=5
	PL_put_integer(t, a);
	PL_put_integer(t+2, b);
	PL_put_variable(t+1);	

	// get access to predicate
	tmp = PL_predicate("plus", 3, "database");

	// make the predicate query
	qid_t query = PL_open_query(NULL, PL_Q_NORMAL, tmp, t);
	
	// check for solutions
	int result = PL_next_solution(query);
	if(result){
		int x;
		PL_get_integer(t+1, &x);
		printf("Solution: %d\n", x);	
	}
	else{
		printf("No solution found\n");	
	}

	PL_close_query(query);
	PL_halt(PL_toplevel() ? 0 : 1);
}

int main(int argc, char **argv){
	/* #ifdef READLINE /* Remove if you don't want readline 
		PL_initialise_hook(install_readline);
	#endif

	if ( !PL_initialise(argc, argv) ){
		PL_halt(1);
	}
	printf("Test Complete\n");*/

	plus_test(4, 9);
	//PL_halt(PL_toplevel() ? 0 : 1);

}
