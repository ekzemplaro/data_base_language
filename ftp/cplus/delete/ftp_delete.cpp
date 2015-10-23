// --------------------------------------------------------------------
/*
	ftp_delete.cpp

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
// extern void curl_delete_proc (char url[]);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char key_in[10];
	strcpy (key_in,argv[1]);

	cout << key_in << endl;

	char url_target[] = "ftp://scott:tiger@host_dbase/city/iwate.json";

	string str_json = url_get_proc (url_target);

	map <string,Unit> dict_aa = json_to_dict_proc (str_json);

	dict_aa.erase (key_in);

//	dict_display_proc (dict_aa);

	string str_json_new = dict_to_json_proc (dict_aa);

cerr << "*** ddd ***\n";

	map <string,Unit> dict_bb = json_to_dict_proc (str_json_new);
cerr << "*** eee ***\n";
	dict_display_proc (dict_bb);
cerr << "*** fff ***\n";

	curl_put_proc (url_target,str_json_new);
cerr << "*** ggg ***\n";

	cout << "--------" << endl;

	cout << str_json_new << endl;

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
