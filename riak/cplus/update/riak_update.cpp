// --------------------------------------------------------------------
/*
	riak_update.cpp

					Sep/22/2015

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<cstring>
#include	<stdlib.h>


using namespace std;

extern string url_get_proc (const char url[]);
extern void curl_put_proc (const char url_target[],string str_in);
extern string json_update_proc (string json_str,int population_in);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char key_in[10];
	strcpy (key_in,argv[1]);
	int population_in = atoi (argv[2]);

	cout << key_in << endl;
	cout << population_in << endl;

	const string url_shimane = "http://host_ubuntu:8098/riak/shimane";
	string url_aa = url_shimane + "/" + key_in;

	string str_json = url_get_proc (url_aa.c_str ());

	string json_str_new = json_update_proc (str_json,population_in);

	curl_put_proc (url_aa.c_str (),json_str_new);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
