// --------------------------------------------------------------------
/*
	redis_create.cpp

					Feb/11/2018

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
extern	int dict_to_redis_proc (int sock,map <string,Unit> dict_aa);
// -----------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t1851","福井",76125,"1922-8-27");

	dict_aa = dict_append_proc (dict_aa,"t1852","敦賀",98637,"1922-2-2");
	dict_aa = dict_append_proc (dict_aa,"t1853","小浜",42915,"1922-7-21");
	dict_aa = dict_append_proc (dict_aa,"t1854","大野",51238,"1922-5-25");

	dict_aa = dict_append_proc (dict_aa,"t1855","勝山",83471,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t1856","鯖江",73249,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t1857","あわら",46185,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t1858","越前",61873,"1922-3-04");
	dict_aa = dict_append_proc (dict_aa,"t1859","坂井",74123,"1922-5-9");

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

	if (getaddrinfo ("localhost","6379",&hints,&addrs) == 0)
		{
		int sock = socket(addrs->ai_family,
		addrs->ai_socktype, addrs->ai_protocol);

		if (0 <= sock)
			{
			if (0 <= socket_connect_proc (sock,addrs))
				{
				dict_to_redis_proc (sock,dict_aa);
				}
			}

		close (sock);

		freeaddrinfo (addrs);
		}

	cerr << "*** 終了 ***\n";
	return 0;
}

// -----------------------------------------------------------------
