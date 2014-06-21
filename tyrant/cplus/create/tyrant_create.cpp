// --------------------------------------------------------------------
/*
	tyrant_create.cpp

					Mar/04/2014

*/
// --------------------------------------------------------------------
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

	dict_aa = dict_append_proc (dict_aa,"t4761","那覇",34715,"1922-10-27");

	dict_aa = dict_append_proc (dict_aa,"t4762","宜野湾",17982,"1922-5-12");
	dict_aa = dict_append_proc (dict_aa,"t4763","石垣",71426,"1922-3-28");
	dict_aa = dict_append_proc (dict_aa,"t4764","浦添",23519,"1922-8-21");

	dict_aa = dict_append_proc (dict_aa,"t4765","名護",83971,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t4766","糸満",73549,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t4767","沖縄",46185,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t4768","豊見城",56138,"1922-3-04");
	dict_aa = dict_append_proc (dict_aa,"t4769","うるま",74523,"1922-5-9");

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

	if (getaddrinfo ("localhost","1978",&hints,&addrs) == 0)
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
		}

	cerr << "*** 終了 ***\n";
	return 0;
}

// -----------------------------------------------------------------
