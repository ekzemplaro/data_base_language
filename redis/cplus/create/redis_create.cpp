// --------------------------------------------------------------------
/*
	redis_create.cpp

						Jun/01/2018
*/
// --------------------------------------------------------------------
#include <iostream>
#include <map>

// -----------------------------------------------------------------------
using namespace std;

typedef map<string,string> Unit;

#define PORT 6379
// -----------------------------------------------------------------
extern map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);
extern int socket_get_proc (const char host[],int port);

extern void dict_to_redis_proc (int sock,map <string,Unit> dict_aa);
// -----------------------------------------------------------------
// [2]:
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t1851","福井",67129,"1922-8-27");
	dict_aa = dict_append_proc (dict_aa,"t1852","敦賀",41637,"1922-2-2");
	dict_aa = dict_append_proc (dict_aa,"t1853","小浜",93915,"1922-7-21");
	dict_aa = dict_append_proc (dict_aa,"t1854","大野",51238,"1922-5-25");
	dict_aa = dict_append_proc (dict_aa,"t1855","勝山",83471,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t1856","鯖江",71249,"1922-9-22");
	dict_aa = dict_append_proc (dict_aa,"t1857","あわら",46185,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t1858","越前",69871,"1922-3-4");
	dict_aa = dict_append_proc (dict_aa,"t1859","坂井",54927,"1922-6-9");

	return	dict_aa;
}

// -----------------------------------------------------------------
int main (int argc, char *argv[])
{
	cerr << "*** 開始 ***\n";

	map <string,Unit> dict_aa = data_prepare_proc ();

	const string host = "127.0.0.1";
	const int port = 6379;

	int sock = socket_get_proc (host.c_str(),port);

	if (0 <= sock)
		{
		dict_to_redis_proc (sock,dict_aa);
		}

	cerr << "*** 終了 ***\n";
	return 0;
}

// -----------------------------------------------------------------
