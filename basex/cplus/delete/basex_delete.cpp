// --------------------------------------------------------------------
/*
	basex_delete.cpp

				Feb/29/2012


*/
// --------------------------------------------------------------------
#include	<string>
#include	<cstring>
#include	<iostream>
#include	<map>
#include	<curl/curl.h>
#include	<boost/lexical_cast.hpp>

#include <stdio.h>
#include <stdlib.h>

using namespace std;
using namespace boost;
typedef map<string,string> Unit;

extern string url_get_proc (char url[]);
extern void curl_put_proc (char *url_target,string str_in);
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	map <string,Unit> xml_to_dict_proc (string str_xml);
extern string dict_to_xml_proc (map <string,Unit> dict_aa);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char key_in[10];
	strcpy (key_in,argv[1]);

	cout << key_in << endl;

	string str_url_target = "http://admin:admin@localhost:8984/rest/cities";
	string str_url_target_bb = str_url_target + "?query=/";


	char url_target[160];
	char url_target_bb[160];

	strcpy (url_target,str_url_target.c_str ());
	strcpy (url_target_bb,str_url_target_bb.c_str ());

	cerr << url_target << endl;
	cerr << url_target_bb << endl;

	string str_xml = url_get_proc (url_target_bb);

	map <string,Unit> dict_aa =  xml_to_dict_proc (str_xml);

	string key = lexical_cast<string>(key_in);
	dict_aa.erase (key);

	dict_display_proc (dict_aa);

	cerr << "*** main ggg ***\n";

	str_xml = dict_to_xml_proc (dict_aa);

	cerr << "*** main hhh ***\n";

	curl_put_proc (url_target,str_xml);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
