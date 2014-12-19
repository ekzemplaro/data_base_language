// --------------------------------------------------------------------
/*
	mcached_delete.cpp

				Nov/24/2014

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<stdio.h>
#include	<sys/socket.h>
#include	<netdb.h>

#include	<boost/algorithm/string.hpp>

using namespace std;
// --------------------------------------------------------------------
extern	int socket_connect_proc (int sock,addrinfo *addrs);
extern	void socket_write_proc (int sock,const char str_command[]);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char	key_in[20];

	strcpy (key_in,argv[1]);

	cerr << key_in << '\n';

	int	sock;
	char str_command[255];
	sprintf (str_command,"delete %s\r\n",key_in);

	addrinfo hints;
	addrinfo *addrs;  
	memset (&hints, 0, sizeof(addrinfo));
	hints.ai_family = AF_UNSPEC;
	hints.ai_socktype = SOCK_STREAM;
 
	if (0 == getaddrinfo ("localhost","11211",&hints,&addrs))
		{
		sock = socket(addrs->ai_family,
			addrs->ai_socktype, addrs->ai_protocol);
		if (0 <= sock)
			{
			if (0 <= socket_connect_proc (sock,addrs))
				{
				socket_write_proc (sock,str_command);
				}
			}

		close(sock);

		freeaddrinfo (addrs);
		}

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------

