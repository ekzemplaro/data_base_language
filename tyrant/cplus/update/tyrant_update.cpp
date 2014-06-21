// --------------------------------------------------------------------
/*
	tyrant_update.cpp

				Jan/21/2014

*/
// --------------------------------------------------------------------
#include	<sys/socket.h>
#include	<netdb.h>

#include	<boost/algorithm/string.hpp>

using namespace std;
// --------------------------------------------------------------------
extern void socket_update_proc (string key,int population,addrinfo *addrs);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char key_in[10];

	strcpy (key_in,argv[1]);

	int population_in = atoi (argv[2]);

	cout << key_in << endl;
	cout << population_in << endl;

	addrinfo hints;
	addrinfo *addrs;

	memset (&hints, 0, sizeof(addrinfo));
	hints.ai_family = AF_UNSPEC;
	hints.ai_socktype = SOCK_STREAM;

	if (0 == getaddrinfo ("localhost","1978",&hints,&addrs))
		{
		socket_update_proc (key_in,population_in,addrs);

		freeaddrinfo(addrs);
		}

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------

