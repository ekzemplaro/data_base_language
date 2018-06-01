// --------------------------------------------------------------------
/*
	mcached_create.cpp

					Jun/01/2018

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<map>

#include	<boost/algorithm/string.hpp>
// -----------------------------------------------------------------------
using namespace std;

typedef map<string,string> Unit;
// -----------------------------------------------------------------
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);

extern int socket_get_proc (const char host[],int port);
extern int dict_to_mcached_exec_proc (int sock,map <string,Unit> dict_aa);
// -----------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t1731","金沢",37125,"1922-8-9");

	dict_aa = dict_append_proc (dict_aa,"t1732","輪島",13982,"1922-6-12");
	dict_aa = dict_append_proc (dict_aa,"t1733","小松",71486,"1922-3-28");
	dict_aa = dict_append_proc (dict_aa,"t1734","七尾",23519,"1922-9-21");

	dict_aa = dict_append_proc (dict_aa,"t1735","珠洲",83471,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t1736","加賀",73249,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t1737","羽咋",46185,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t1738","かほく",57614,"1922-3-04");
	dict_aa = dict_append_proc (dict_aa,"t1739","白山",71523,"1922-5-9");

	return	dict_aa;
}

// -----------------------------------------------------------------
int main (int argc, char *argv[])
{
	cerr << "*** 開始 ***\n";

	map <string,Unit> dict_aa = data_prepare_proc ();

	const string host = "127.0.0.1";
	const int port = 11211;

	int sock = socket_get_proc (host.c_str(),port);

	if (0<= sock)
		{
		cerr << "*** check ddd ***\n";
		dict_to_mcached_exec_proc (sock,dict_aa);
		}

	close(sock);

	cerr << "*** 終了 ***\n";
	return 0;
}

// -----------------------------------------------------------------
