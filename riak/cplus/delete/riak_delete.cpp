// --------------------------------------------------------------------
/*
	riak_delete.cpp

					Mar/04/2014

*/
// --------------------------------------------------------------------
#include	<string>
#include	<iostream>
#include	<cstring>
#include	<stdlib.h>

using namespace std;

extern void curl_delete_proc (const char url[]);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char key_in[10];
	strcpy (key_in,argv[1]);

	cout << key_in << endl;

	const string url_shimane = "http://localhost:8098/riak/shimane";
	string url_aa = url_shimane + "/" + key_in;

	curl_delete_proc (url_aa.c_str ());

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
