// --------------------------------------------------------------------
/*
	couch_read.cpp

					Mar/03/2014

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

//	char url_target[] = "http://host_dbase:5984/city/cities";
//	char url_target[] = "http://cddn007:5984/city/cities";
	char url_target[] = "http://localhost:5984/nagano/_all_docs?include_docs=true";

	cerr << "*** aaa ***\n";
	string str_json = url_get_proc (url_target);
	cerr << "*** bbb ***\n";

/*
	map <string,Unit> dict_aa = json_to_dict_proc (str_json);

	dict_display_proc (dict_aa);
*/

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
