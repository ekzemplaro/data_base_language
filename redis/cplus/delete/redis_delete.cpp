// --------------------------------------------------------------------
/*
	redis_delete.cpp

				Jun/01/2018

*/
// --------------------------------------------------------------------
#include	<iostream>

#include	<boost/algorithm/string.hpp>

using namespace std;
// --------------------------------------------------------------------
extern	void socket_write_proc (int sock,const char str_command[]);
extern int socket_get_proc (const char host[],int port);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char	key_in[20];

	strcpy (key_in,argv[1]);

	cerr << key_in << '\n';

	const string host = "127.0.0.1";
	const int port = 6379;

	int sock = socket_get_proc (host.c_str(),port);

	if (0 <= sock)
		{
		char str_command[255];
		sprintf (str_command,"del %s\r\n",key_in);
		socket_write_proc (sock,str_command);
		}

	close(sock);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------

