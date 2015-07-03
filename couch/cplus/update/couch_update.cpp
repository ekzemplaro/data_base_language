// --------------------------------------------------------------------
/*
	couch_update.cpp

					Jun/18/2015

*/
// --------------------------------------------------------------------
#include	<string>
#include	<iostream>
#include	<map>
#include	<cstring>
#include	<stdlib.h>

#include	<boost/lexical_cast.hpp>
#include	<boost/tokenizer.hpp>

#include "/var/www/data_base/common/cplus_common/include/picojson.h"

using namespace std;
using namespace boost;
using namespace picojson;

// typedef map<string,string> Unit;

extern string get_current_date_proc ();

extern string url_get_proc (const char url[]);
extern void curl_put_proc (const char *url_target,string str_in);
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
	int population_in = atoi (argv[2]);

	cerr << key_in << endl;
	cerr << population_in << endl;

	char url_collection[] = "http://localhost:5984/nagano/";
	char url_target[160];

	strcpy (url_target,url_collection);
	strcat (url_target,key_in);

//	cerr << url_target << endl;

	string json_str = url_get_proc (url_target);

//	cerr << json_str << endl;

	string today = get_current_date_proc ();

//	cerr << today << endl;

	object obj = json_record_parser (json_str);

	string id = obj["_id"].to_str ();
	string rev = obj["_rev"].to_str ();
	string name = obj["name"].to_str ();

/*
	cerr << obj["_rev"].to_str () << endl;
	cerr << obj["name"].to_str () << endl;
	cerr << obj["population"].to_str () << endl;
	cerr << obj["date_mod"].to_str () << endl;
*/

	object oo;
	oo.insert (make_pair("_id", id));
	oo.insert (make_pair("_rev", rev));
	oo.insert (make_pair("name", name));
	oo.insert (make_pair("population",lexical_cast<string>(population_in)));
	oo.insert (make_pair("date_mod", today));

	value json_value_new = value (oo);
	string ssx = json_value_new.serialize ();

	cerr << ssx << endl;

	curl_put_proc (url_target,ssx);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
