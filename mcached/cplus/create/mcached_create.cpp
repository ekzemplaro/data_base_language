// --------------------------------------------------------------------
/*
	mcached_create.cpp

					Feb/10/2015

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<map>

// -----------------------------------------------------------------------
using namespace std;

typedef map<string,string> Unit;
// -----------------------------------------------------------------
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);
extern void dict_to_mcached_proc (char server[],int port,map <string,Unit> dict_aa);

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

	char server[] = "localhost";
	int port = 11211;

	dict_to_mcached_proc (server,port,dict_aa);

	cerr << "*** 終了 ***\n";
	return 0;
}

// -----------------------------------------------------------------
