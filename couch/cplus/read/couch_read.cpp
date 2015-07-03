// --------------------------------------------------------------------
/*
	couch_read.cpp

					Jun/19/2015

*/
// --------------------------------------------------------------------
#include	<string>
#include	<iostream>
#include	<map>

#include "/var/www/data_base/common/cplus_common/include/picojson.h"

using namespace std;
using namespace picojson;
typedef map<string,string> Unit;

extern string url_get_proc (const char url[]);
// extern map <string,Unit> json_to_dict_proc (string str_json);
extern	void dict_display_proc (map <string,Unit> dict_aa);


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

	char url_target[] = "http://localhost:5984/nagano/_all_docs?include_docs=true";

	cerr << "*** aaa ***\n";
	string str_json = url_get_proc (url_target);
	cerr << "*** bbb ***\n";

	object obj = json_record_parser (str_json);

	cerr << obj["total_rows"].to_str () << endl;
	cerr << obj["rows"].to_str () << endl;

	int icount = 0;
	picojson::array array = obj["rows"].get<picojson::array>();
	for (picojson::array::iterator it = array.begin(); it != array.end(); it++)
	{
	cerr << icount << "\t";
	object& oo = it->get<picojson::object>();
	string key = oo["key"].to_str ();
	string doc = oo["doc"].to_str ();
//	object doc_2 = oo["doc"];
//	string name = doc["name"].to_str ();
//	string date_mod = oo["date_mod"].to_str ();
	cerr << key << "\t";
//	cerr << doc << "\t";
//	cerr << name << "\t";
//	cerr << date_mod << endl;
	cerr << doc << endl;
	icount++;
	}

//	cerr << str_json << endl;
/*
	map <string,Unit> dict_aa = json_to_dict_proc (str_json);

	dict_display_proc (dict_aa);
*/

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
