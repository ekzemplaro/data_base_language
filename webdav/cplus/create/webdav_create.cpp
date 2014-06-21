// --------------------------------------------------------------------
/*
	webdav_create.cpp

					Mar/04/2014
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
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);

extern string dict_to_json_proc (map <string,Unit> dict_aa);
extern void curl_put_proc (const char *url_target,string str_in);
// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t1351","八王子",75423,"1922-5-28");
	dict_aa = dict_append_proc (dict_aa,"t1352","立川",23587,"1922-12-12");
	dict_aa = dict_append_proc (dict_aa,"t1353","武蔵野",29128,"1922-3-21");
	dict_aa = dict_append_proc (dict_aa,"t1354","三鷹",51486,"1922-9-24");
	dict_aa = dict_append_proc (dict_aa,"t1355","青梅",83971,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t1356","府中",74918,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t1357","昭島",46785,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t1358","調布",59614,"1922-3-4");
	dict_aa = dict_append_proc (dict_aa,"t1359","町田",71238,"1922-5-9");

	return	dict_aa;
}
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

//	char url_target[] = "http://host_dbase:3004/city/tokyo.json";
	char url_target[] = "http://cddn007:3004/city/tokyo.json";

	map <string,Unit> dict_aa = data_prepare_proc ();

	cout << "要素数：" << (unsigned int)dict_aa.size() << endl;

	string str_json = dict_to_json_proc (dict_aa);

	curl_put_proc (url_target,str_json);

	cerr << "*** 終了 ***\n";
}

// --------------------------------------------------------------------
