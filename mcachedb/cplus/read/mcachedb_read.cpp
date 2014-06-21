// --------------------------------------------------------------------
/*
	mcachedb_read.cpp

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

	int	nmax = 12;
	string keys[] = {"t1521","t1522","t1523","t1524","t1525", 
			"t1526","t1527","t1528","t1529",
			"t1530","t1531","t1532"};

	if (0 == getaddrinfo ("localhost","21201",&hints,&addrs))
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

