// --------------------------------------------------------------------
/*
	webdav_delete.cpp

					Mar/04/2014

*/
// --------------------------------------------------------------------
#include	<string>
#include	<iostream>
#include	<map>
#include	<cstring>
#include	<stdlib.h>

using namespace std;
typedef map<string,string> Unit;

extern map <string,Unit> json_to_dict_proc (string str_json);
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern string dict_to_json_proc (map <string,Unit> dict_aa);
extern string url_get_proc (const char url[]);
extern void curl_put_proc (const char *url_target,string str_in);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char key_in[10];
	strcpy (key_in,argv[1]);

	cout << key_in << endl;

//	char url_target[] = "http://host_dbase:3004/city/tokyo.json";
	char url_target[] = "http://cddn007:3004/city/tokyo.json";

	string str_json = url_get_proc (url_target);

	map <string,Unit> dict_aa = json_to_dict_proc (str_json);

	dict_aa.erase (key_in);

	dict_display_proc (dict_aa);

	str_json = dict_to_json_proc (dict_aa);

	curl_put_proc (url_target,str_json);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
