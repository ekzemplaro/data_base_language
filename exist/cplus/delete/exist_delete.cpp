// --------------------------------------------------------------------
/*
	exist_delete.cpp

				Mar/28/2013


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

	char url_target[] = "http://localhost:8086/exist/rest/cities/cities.xml";

	string str_xml = url_get_proc (url_target);

	map <string,Unit> dict_aa =  xml_to_dict_proc (str_xml);

	string key = lexical_cast<string>(key_in);
	dict_aa.erase (key);

	dict_display_proc (dict_aa);

	str_xml = dict_to_xml_proc (dict_aa);

	curl_put_proc (url_target,str_xml);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
