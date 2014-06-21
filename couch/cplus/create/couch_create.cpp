// --------------------------------------------------------------------
/*
	couch_create.cpp

				Mar/04/2014
*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<sstream>
#include	<string>
#include	<map>

#include	<string.h>
#include	<boost/lexical_cast.hpp>
#include	<boost/foreach.hpp>

using namespace std;
using namespace boost;

typedef map<string,string> Unit;
// --------------------------------------------------------------------
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);

extern string dict_to_json_proc (map <string,Unit> dict_aa);
extern string url_get_proc (const char url[]);
extern void curl_put_proc (const char *url_target,string str_in);
extern void curl_delete_proc (const char url[]);
// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t2021","長野",38197,"1922-6-12");

	dict_aa = dict_append_proc (dict_aa,"t2022","松本",98235,"1922-19-25");
	dict_aa = dict_append_proc (dict_aa,"t2023","上田",73128,"1922-3-21");
	dict_aa = dict_append_proc (dict_aa,"t2024","小諸",51486,"1922-9-8");

	dict_aa = dict_append_proc (dict_aa,"t2025","岡谷",83671,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t2026","塩尻",74948,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t2027","茅野",46185,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t2028","飯田",59614,"1922-3-04");
	dict_aa = dict_append_proc (dict_aa,"t2029","中野",71823,"1922-5-9");
	dict_aa = dict_append_proc (dict_aa,"t2030","諏訪",82361,"1922-8-12");
	dict_aa = dict_append_proc (dict_aa,"t2031","駒ヶ根",36428,"1922-5-25");
	dict_aa = dict_append_proc (dict_aa,"t2032","佐久",19854,"1922-4-8");
	dict_aa = dict_append_proc (dict_aa,"t2033","伊那",82617,"1922-5-17");
	dict_aa = dict_append_proc (dict_aa,"t2034","千曲",35784,"1922-6-21");

	return	dict_aa;
}
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

//	char url_collection[] = "http://host_dbase:5984/city";
	char url_collection[] = "http://cddn007:5984/city";
	char url_target[160];

	strcpy (url_target,url_collection);
	strcat (url_target,"/cities");
cerr << "*** aaa ***\n";

	curl_delete_proc (url_collection);
cerr << "*** baa ***\n";
	curl_put_proc (url_collection,"");
cerr << "*** caa ***\n";

	map <string,Unit> dict_aa = data_prepare_proc ();

	cout << "要素数：" << (unsigned int)dict_aa.size() << endl;

	string str_json = dict_to_json_proc (dict_aa);

cerr << "*** daa ***\n";
	curl_put_proc (url_target,str_json);
cerr << "*** eaa ***\n";

	cerr << "*** 終了 ***\n";
}

// --------------------------------------------------------------------
