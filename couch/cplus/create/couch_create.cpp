// --------------------------------------------------------------------
/*
	couch_create.cpp

					Jun/19/2015
*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<sstream>
#include	<string>
#include	<map>

#include	<string.h>

#include "/var/www/data_base/common/cplus_common/include/picojson.h"

using namespace std;
using namespace picojson;

typedef map<string,string> Unit;
// --------------------------------------------------------------------
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);

extern void curl_put_proc (const char *url_target,string str_in);
extern void curl_delete_proc (const char url[]);
// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t2021","長野",32197,"1922-6-12");

	dict_aa = dict_append_proc (dict_aa,"t2022","松本",97235,"1922-19-25");
	dict_aa = dict_append_proc (dict_aa,"t2023","上田",75128,"1922-3-21");
	dict_aa = dict_append_proc (dict_aa,"t2024","小諸",52486,"1922-9-8");

	dict_aa = dict_append_proc (dict_aa,"t2025","岡谷",83671,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t2026","塩尻",71948,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t2027","茅野",46185,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t2028","飯田",59614,"1922-3-04");
	dict_aa = dict_append_proc (dict_aa,"t2029","中野",71823,"1922-5-9");
	dict_aa = dict_append_proc (dict_aa,"t2030","諏訪",82361,"1922-8-12");
	dict_aa = dict_append_proc (dict_aa,"t2031","駒ヶ根",36428,"1922-5-25");
	dict_aa = dict_append_proc (dict_aa,"t2032","佐久",19854,"1922-4-8");
	dict_aa = dict_append_proc (dict_aa,"t2033","伊那",82617,"1922-5-17");
	dict_aa = dict_append_proc (dict_aa,"t2034","千曲",35284,"1922-6-21");

	return	dict_aa;
}
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char url_collection[] = "http://localhost:5984/nagano/";
	char url_target[160];

	curl_delete_proc (url_collection);
	curl_put_proc (url_collection,"");

	map <string,Unit> dict_aa = data_prepare_proc ();

	cout << "要素数：" << (unsigned int)dict_aa.size() << endl;


	map <string,Unit>:: iterator it = dict_aa.begin ();

	while (it != dict_aa.end ())
		{
		Unit unit_aa = (*it).second;
		string key = (*it).first;

		object oo;
		oo.insert (make_pair("name",unit_aa["name"]));
		oo.insert (make_pair("population",unit_aa["population"]));
		oo.insert (make_pair("date_mod",unit_aa["date_mod"]));

		value json_value_new = value (oo);
		string ssx = json_value_new.serialize ();

		strcpy (url_target,url_collection);
		strcat (url_target,key.c_str ());
		curl_put_proc (url_target,ssx);

		it++;
		}

	cerr << "*** 終了 ***\n";
}

// --------------------------------------------------------------------
