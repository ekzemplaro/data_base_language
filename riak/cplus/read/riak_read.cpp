// --------------------------------------------------------------------
/*
	riak_read.cpp

					Feb/10/2015
*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<map>

#include	<boost/lexical_cast.hpp>


using namespace std;
using namespace boost;

typedef map<string,string> Unit;

extern string url_get_proc (const char url[]);

extern int get_riak_keys (string json_str,string keys[]);
extern Unit json_to_unit_proc (string json_str);

extern	void dict_display_proc (map <string,Unit> dict_aa);

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	const string url_shimane = "http://host_ubuntu1:8098/riak/shimane";
	string url_aa = url_shimane + "?keys=true";


	string str_json = url_get_proc (url_aa.c_str());

	string keys [20];
	int nn_keys = get_riak_keys (str_json,keys);

	map <string,Unit> dict_aa;

	for (int it=0; it < nn_keys; it++)
		{
		string url_cc = url_shimane + "/" +   keys[it];
		string str_json_cc = url_get_proc (url_cc.c_str());

		if (3 < str_json_cc.length ())
			{

			string key = keys[it];
			dict_aa[key] = json_to_unit_proc (str_json_cc);
			}
		}


	dict_display_proc (dict_aa);
	
	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
