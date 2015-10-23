// --------------------------------------------------------------------
/*
	couch_delete.cpp

					Jun/19/2015

*/
// --------------------------------------------------------------------
#include	<string>
#include	<iostream>
#include	<map>
#include	<cstring>
#include	<stdlib.h>


#include "/var/www/data_base/common/cplus_common/include/picojson.h"

using namespace std;
using namespace picojson;


extern string url_get_proc (const char url[]);
extern void curl_delete_proc (const char url[]);
// --------------------------------------------------------------------
object json_record_parser (string json_str)
{
	char* data_xx;
	data_xx = (char*) malloc(4096);
	size_t size_xx = json_str.size ();

	strcpy (data_xx,json_str.c_str ());

	value vv;
	string err;

	parse (vv, data_xx, data_xx + size_xx, &err);

	object obj;

	if (err.empty())
		{
		obj = vv.get<object>();
		}
	else
		{
		cerr << err << endl;
		}


	free (data_xx);

	return	obj;
}

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char key_in[10];
	strcpy (key_in,argv[1]);

	cerr << key_in << endl;

	char url_collection[] = "http://localhost:5984/nagano/";
	char url_target[160];
	char url_delete[160];

	strcpy (url_target,url_collection);
	strcat (url_target,key_in);

	string json_str = url_get_proc (url_target);

	object obj = json_record_parser (json_str);

	string rev = obj["_rev"].to_str ();

	cerr << obj["_rev"].to_str () << endl;
	cerr << obj["name"].to_str () << endl;

	strcpy (url_delete,url_target);
	strcat (url_delete,"?rev=");
	strcat (url_delete,rev.c_str ());

	curl_delete_proc (url_delete);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
