// --------------------------------------------------------------------
/*
	tyrant_read.cpp

				Jan/21/2014

*/
// --------------------------------------------------------------------
#include	<netdb.h>
#include	<boost/algorithm/string.hpp>

using namespace std;
// --------------------------------------------------------------------
extern void socket_read_proc (string key,addrinfo *addrs);

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	addrinfo hints;
	addrinfo *addrs;

	memset (&hints, 0, sizeof(addrinfo));
	hints.ai_family = AF_UNSPEC;
	hints.ai_socktype = SOCK_STREAM;

	int	nmax = 9;
	string keys[] = {"t4761","t4762","t4763","t4764","t4765", 
			"t4766","t4767","t4768","t4769"};

	if (0 == getaddrinfo ("localhost","1978",&hints,&addrs))
		{
		for (int it=0; it < nmax; it++)
			{
			socket_read_proc (keys[it],addrs);
			}

		freeaddrinfo(addrs);
		}

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------

