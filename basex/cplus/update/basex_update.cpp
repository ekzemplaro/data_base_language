// --------------------------------------------------------------------
/*
	basex_update.cpp

				Feb/29/2012


*/
// --------------------------------------------------------------------
#include	<string>
#include	<cstring>
#include	<iostream>
#include	<map>
#include	<curl/curl.h>

#include <stdio.h>
#include <stdlib.h>

using namespace std;
typedef map<string,string> Unit;

extern string url_get_proc (char url[]);
extern void curl_put_proc (char *url_target,string str_in);
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	map <string,Unit> xml_to_dict_proc (string str_xml);
extern map <string,Unit> dict_update_proc
	(map <string,Unit> dict_aa,char id_in[],int population_in);
extern string dict_to_xml_proc (map <string,Unit> dict_aa);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char key_in[10];
	strcpy (key_in,argv[1]);
	int population_in = atoi (argv[2]);

	cout << key_in << '\t';
	cout << population_in << endl;

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


	dict_aa = dict_update_proc (dict_aa,key_in,population_in);


	dict_display_proc (dict_aa);

	cerr << "*** main ggg ***\n";

	str_xml = dict_to_xml_proc (dict_aa);

	cerr << "*** main hhh ***\n";

	curl_put_proc (url_target,str_xml);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
