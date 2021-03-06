// --------------------------------------------------------------------
/*
	mcachedb_create.cpp

					Feb/10/2015

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
extern void dict_to_mcached_proc (char server[],int port,map <string,Unit> dict_aa);
// -----------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t1521","新潟",73925,"1922-2-15");

	dict_aa = dict_append_proc (dict_aa,"t1522","長岡",98562,"1922-5-27");
	dict_aa = dict_append_proc (dict_aa,"t1523","新発田",41356,"1922-8-7");
	dict_aa = dict_append_proc (dict_aa,"t1524","上越",51972,"1922-4-18");

	dict_aa = dict_append_proc (dict_aa,"t1525","糸魚川",83471,"1922-3-5");
	dict_aa = dict_append_proc (dict_aa,"t1526","加茂",73249,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t1527","三条",46185,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t1528","佐渡",61748,"1922-3-04");
	dict_aa = dict_append_proc (dict_aa,"t1529","柏崎",74521,"1922-5-9");
	dict_aa = dict_append_proc (dict_aa,"t1530","村上",52629,"1922-2-15");
	dict_aa = dict_append_proc (dict_aa,"t1531","十日町",42651,"1922-5-9");
	dict_aa = dict_append_proc (dict_aa,"t1532","五泉",21473,"1922-8-21");

	return	dict_aa;
}

// -----------------------------------------------------------------
int main (int argc, char *argv[])
{
	cerr << "*** 開始 ***\n";

	map <string,Unit> dict_aa = data_prepare_proc ();

	char server[] = "host_ubuntu1";
	int port = 21201;

	dict_to_mcached_proc (server,port,dict_aa);

	cerr << "*** 終了 ***\n";
	return 0;
}

// -----------------------------------------------------------------
