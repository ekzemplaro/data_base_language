// --------------------------------------------------------------------
/*
	couch_update.cpp

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
extern map <string,Unit> dict_update_proc
	(map <string,Unit> dict_aa,char key_in[],int population_in);
extern string dict_to_json_proc (map <string,Unit> dict_aa);
extern string url_get_proc (const char url[]);
extern void curl_put_proc (const char *url_target,string str_in);
extern void curl_delete_proc (const char url[]);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char key_in[10];
	strcpy (key_in,argv[1]);
	int population_in = atoi (argv[2]);

	cout << key_in << endl;
	cout << population_in << endl;

//	char url_collection[] = "http://host_dbase:5984/city";
	char url_collection[] = "http://cddn007:5984/city";
	char url_target[160];

	strcpy (url_target,url_collection);
	strcat (url_target,"/cities");

	string str_json = url_get_proc (url_target);

	map <string,Unit> dict_aa = json_to_dict_proc (str_json);

	dict_aa = dict_update_proc (dict_aa,key_in,population_in);

	dict_display_proc (dict_aa);

	str_json = dict_to_json_proc (dict_aa);

	curl_delete_proc (url_collection);
	curl_put_proc (url_collection,"");
	curl_put_proc (url_target,str_json);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
