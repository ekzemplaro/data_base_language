// --------------------------------------------------------------------
/*
	basex_create.cpp
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

	dict_aa = dict_append_proc (dict_aa,"t4161","佐賀",79526,"1922-10-9");

	dict_aa = dict_append_proc (dict_aa,"t4162","唐津",98231,"1922-12-12");
	dict_aa = dict_append_proc (dict_aa,"t4163","鳥栖",23429,"1922-3-28");
	dict_aa = dict_append_proc (dict_aa,"t4164","多久",51486,"1922-9-21");

	dict_aa = dict_append_proc (dict_aa,"t4165","伊万里",83923,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t4166","武雄",74825,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t4167","鹿島",46785,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t4168","小城",59614,"1922-3-4");
	dict_aa = dict_append_proc (dict_aa,"t4169","嬉野",41821,"1922-5-8");

	return	dict_aa;
}

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char url_target[] = "http://admin:admin@localhost:8984/rest/cities";


	map <string,Unit> dict_aa = data_prepare_proc ();

	cerr << "*** bbb ***\n";
	string str_xml = dict_to_xml_proc (dict_aa);

	cerr << "*** ccc ***\n";

	curl_put_proc (url_target,str_xml);


	cerr << "*** 終了 ***\n";
}

// --------------------------------------------------------------------
