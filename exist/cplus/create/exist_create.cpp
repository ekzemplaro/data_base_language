// --------------------------------------------------------------------
/*
	exist_create.cpp
				Feb/28/2012

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<sstream>
#include	<string>
#include	<map>

#include	<string.h>

using namespace std;

typedef map<string,string> Unit;

// --------------------------------------------------------------------
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);
extern string dict_to_xml_proc (map <string,Unit> dict_aa);
extern void curl_put_proc (char *url_target,string str_in);
// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t4251","長崎",71526,"1922-10-7");

	dict_aa = dict_append_proc (dict_aa,"t4252","佐世保",98231,"1922-12-12");
	dict_aa = dict_append_proc (dict_aa,"t4253","島原",23469,"1922-3-28");
	dict_aa = dict_append_proc (dict_aa,"t4254","大村",51486,"1922-9-21");

	dict_aa = dict_append_proc (dict_aa,"t4255","諫早",83971,"1922-10-5");
	dict_aa = dict_append_proc (dict_aa,"t4256","五島",74528,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t4257","平戸",46752,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t4258","雲仙",61437,"1922-3-4");
	dict_aa = dict_append_proc (dict_aa,"t4259","松浦",89326,"1922-5-8");

	return	dict_aa;
}

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char url_target[] = "http://localhost:8086/exist/rest/cities/cities.xml";

	map <string,Unit> dict_aa = data_prepare_proc ();

	string str_xml = dict_to_xml_proc (dict_aa);

	curl_put_proc (url_target,str_xml);


	cerr << "*** 終了 ***\n";
}

// --------------------------------------------------------------------
