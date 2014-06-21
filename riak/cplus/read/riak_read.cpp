// --------------------------------------------------------------------
/*
	riak_read.cpp

					Mar/04/2014
*/
// --------------------------------------------------------------------
#include	<string>
#include	<iostream>
#include	<string.h>

using namespace std;

extern string url_get_proc (const char url[]);

extern void json_record_display (string key_in,string json_str);
extern int get_riak_keys (string json_str,string keys[]);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	const string url_shimane = "http://localhost:8098/riak/shimane";
	string url_aa = url_shimane + "?keys=true";

	string str_json = url_get_proc (url_aa.c_str());

	string keys [20];
	int nn_keys = get_riak_keys (str_json,keys);

	for (int it=0; it < nn_keys; it++)
		{
		string url_cc = url_shimane + "/" +   keys[it];
		string str_json_cc = url_get_proc (url_cc.c_str());
		json_record_display (keys[it],str_json_cc);
		}

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
