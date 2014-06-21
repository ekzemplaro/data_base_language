// --------------------------------------------------------------------
/*
	redis_read.cpp

				Mar/04/2014

*/
// --------------------------------------------------------------------
#include	<netdb.h>
#include	<boost/algorithm/string.hpp>

using namespace std;
// --------------------------------------------------------------------
extern void redis_socket_read_proc (string key,addrinfo *addrs);

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
	string keys[] = {"t1851","t1852","t1853","t1854","t1855", 
			"t1856","t1857","t1858","t1859"};

	const char *hostname = "host_dbase";
	const char *port = "6379";

	if (0 == getaddrinfo (hostname,port,&hints,&addrs))
		{
		for (int it=0; it < nmax; it++)
			{
			redis_socket_read_proc (keys[it],addrs);
			}

		freeaddrinfo(addrs);
		}

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------

