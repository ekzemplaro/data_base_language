// --------------------------------------------------------------------
/*
	tyrant_update.cpp

				Feb/10/2015

*/
// --------------------------------------------------------------------
#include	<iostream>

#include	<boost/algorithm/string.hpp>

using namespace std;
// --------------------------------------------------------------------
extern void mcached_update_proc
	(char server[],int port,char key_in[],int population_in);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char key_in[10];

	strcpy (key_in,argv[1]);

	int population_in = atoi (argv[2]);

	cout << key_in << endl;
	cout << population_in << endl;

	char server[] = "host_ubuntu1";
	int port = 1978;

	mcached_update_proc (server,port,key_in,population_in);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------

