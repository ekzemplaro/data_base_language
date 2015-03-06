// --------------------------------------------------------------------
/*
	tyrant_delete.cpp

				Feb/10/2015

*/
// --------------------------------------------------------------------
#include	<iostream>

#include	<boost/algorithm/string.hpp>

using namespace std;
// --------------------------------------------------------------------
extern void mcached_delete_proc (char server[],int port,char key_in[]);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char	key_in[20];

	strcpy (key_in,argv[1]);

	cerr << key_in << '\n';

	char server[] = "host_ubuntu1";
	int port = 1978;

	mcached_delete_proc (server,port,key_in);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------

