// --------------------------------------------------------------------
/*
	ftp_read.cpp

					Mar/04/2014

*/
// --------------------------------------------------------------------
#include	<string>
#include	<iostream>
#include	<map>

using namespace std;
typedef map<string,string> Unit;

extern string url_get_proc (const char url[]);
extern map <string,Unit> json_to_dict_proc (string str_json);
extern	void dict_display_proc (map <string,Unit> dict_aa);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char url_target[] = "ftp://scott:tiger@host_dbase/city/iwate.json";

	string str_json = url_get_proc (url_target);

	map <string,Unit> dict_aa = json_to_dict_proc (str_json);

	dict_display_proc (dict_aa);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
