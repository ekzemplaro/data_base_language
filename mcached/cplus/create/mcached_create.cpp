// --------------------------------------------------------------------
/*
	mcached_create.cpp

					Nov/24/2014

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<map>

#include	<sys/socket.h>
#include	<netdb.h>

#include	<boost/algorithm/string.hpp>
// -----------------------------------------------------------------------
using namespace std;

typedef map<string,string> Unit;
// -----------------------------------------------------------------
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);
extern	int socket_connect_proc (int sock,addrinfo *addrs);
extern	int dict_to_mcached_proc (int sock,map <string,Unit> dict_aa);
// -----------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t1731","金沢",34125,"1922-10-07");

	dict_aa = dict_append_proc (dict_aa,"t1732","輪島",13982,"1922-2-12");
	dict_aa = dict_append_proc (dict_aa,"t1733","小松",71486,"1922-3-28");
	dict_aa = dict_append_proc (dict_aa,"t1734","七尾",23519,"1922-8-21");

	dict_aa = dict_append_proc (dict_aa,"t1735","珠洲",83471,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t1736","加賀",73249,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t1737","羽咋",46185,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t1738","かほく",57614,"1922-3-04");
	dict_aa = dict_append_proc (dict_aa,"t1739","白山",74523,"1922-5-9");

	return	dict_aa;
}

// -----------------------------------------------------------------
int main (int argc, char *argv[])
{
	cerr << "*** 開始 ***\n";

	map <string,Unit> dict_aa = data_prepare_proc ();

	addrinfo hints;
	addrinfo *addrs;

	memset (&hints, 0, sizeof(addrinfo));
	hints.ai_family = AF_UNSPEC;
	hints.ai_socktype = SOCK_STREAM;

	if (getaddrinfo ("localhost","11211",&hints,&addrs) == 0)
		{
		int sock = socket(addrs->ai_family,
		addrs->ai_socktype, addrs->ai_protocol);

		if (0 <= sock)
			{
			if (0 <= socket_connect_proc (sock,addrs))
				{
				dict_to_mcached_proc (sock,dict_aa);
				}
			}

		close (sock);

		freeaddrinfo (addrs);
		}

	cerr << "*** 終了 ***\n";
	return 0;
}

// -----------------------------------------------------------------
