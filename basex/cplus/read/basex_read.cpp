// --------------------------------------------------------------------
/*
	basex_read.cpp

				Feb/27/2012


*/
// --------------------------------------------------------------------
#include	<string>
#include	<iostream>
#include	<map>
#include	<curl/curl.h>

#include <stdio.h>
#include <stdlib.h>

using namespace std;
typedef map<string,string> Unit;

extern string url_get_proc (char url[]);
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	map <string,Unit> xml_to_dict_proc (string str_xml);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char url[] = "http://admin:admin@localhost:8984/rest/cities?query=/";

	string str_xml = url_get_proc (url);

	map <string,Unit> dict_aa =  xml_to_dict_proc (str_xml);

	dict_display_proc (dict_aa);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
