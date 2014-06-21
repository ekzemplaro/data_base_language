// -----------------------------------------------------------------------
/*
	json_manipulate.cpp

					Mar/04/2014
*/
// -----------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<string>
#include	<boost/lexical_cast.hpp>
// #include <typeinfo>

#include "/var/www/data_base/common/cplus_common/include/picojson.h"

// -----------------------------------------------------------------------
using namespace std;
using namespace boost;
using namespace picojson;

typedef map<string,string> Unit;
extern string get_current_date_proc ();
// -----------------------------------------------------------------------
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);
// -----------------------------------------------------------------------
map <string,Unit> json_row_append_proc
	(map <string,Unit> dict_aa,object obj,string key)
{
	object obj_bb = obj[key].get<object>();
	string name = obj_bb["name"].to_str ();

	if (name != "null")
		{
		string str_pop = obj_bb["population"].to_str ();
		int population = atoi (str_pop.c_str ());
		dict_aa = dict_append_proc (dict_aa,key,name,
			population,obj_bb["date_mod"].to_str ());
		}

	return	dict_aa;
}

// -----------------------------------------------------------------------
map <string,Unit> json_to_dict_proc (string str_json)
{
	map <string,Unit> dict_aa;

	char* data_xx;
	data_xx = (char*) malloc(4096);
	size_t size_xx = str_json.size ();

	strcpy (data_xx,str_json.c_str ());

	value vv;
	string err;

	parse (vv, data_xx, data_xx + size_xx, &err);

	if (err.empty())
		{
		object obj = vv.get<object>();

	for (picojson::object::iterator it=obj.begin (); it != obj.end (); it++)
		{
		string key_pp = (*it).first;

		if ((key_pp != "_id") && (key_pp != "_rev"))
			{
		dict_aa = json_row_append_proc (dict_aa,obj,key_pp);
			}
		}
		}
	else
		{
		cerr << err << endl;
		}

	free (data_xx);

	return	dict_aa;
}

// -----------------------------------------------------------------------
// [8-4-4]:
string tag_out_proc_int (string str_key,int data_in)
{
	string str_out = "\"" + str_key + "\":";
	str_out += lexical_cast<string>(data_in);

	return	str_out;
}

// -----------------------------------------------------------------------
// [8-4-6]:
string tag_out_proc_string (string str_key,string data_in)
{
	string str_out =  "\"" + str_key + "\":";
	str_out +=  ("\"" + data_in + "\"");

	return	str_out;
}

// -----------------------------------------------------------------------
// [8-4]:
static string data_prepare_unit (string key_in,string name_in,
	int population_in,string date_mod_in,string tx)
{
	string str_out = "\"";
	str_out += key_in;
	str_out += "\":{";
	str_out += tag_out_proc_string ("name",name_in);
	str_out += ",";
	str_out += tag_out_proc_int ("population",population_in);
	str_out += ",";
	str_out += tag_out_proc_string ("date_mod",date_mod_in);
	str_out +=  "}";
	str_out +=  tx;

	return	str_out;
}

// -----------------------------------------------------------------------
// [8]:
string dict_to_json_proc (map <string,Unit> dict_aa)
{
	int nnx = (unsigned int)dict_aa.size();

	string tx = ",";

	string str_out = "{";

	map <string,Unit>:: iterator it = dict_aa.begin ();

	int count = 0;
	while (it != dict_aa.end ())
		{
		string key = (*it).first;
		Unit unit_aa = (*it).second;

		if ((nnx -1 ) <= count)
			{
			tx = "}";
			}

		str_out += data_prepare_unit (key,unit_aa["name"],
			atoi (unit_aa["population"].c_str ()),
			unit_aa["date_mod"],tx);
		it++;

		count++;
		}

	return	str_out;
}

// -----------------------------------------------------------------------
object json_record_parser (string json_str)
{
//	cout << json_str << endl;

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

// -----------------------------------------------------------------------
void json_record_display (string key_in,string json_str)
{

	object obj = json_record_parser (json_str);

	cout << key_in << "\t";

	string name = obj["name"].to_str ();
	cout << name << "\t";
	string population = obj["population"].to_str ();
	cout << population << "\t";
	string date_mod = obj["date_mod"].to_str ();
	cout << date_mod << "\n";
}

// -----------------------------------------------------------------------
string unit_to_json_proc (Unit unit_aa)
{
	string str_out = "{";
	str_out += tag_out_proc_string ("name",unit_aa["name"]);
	str_out += ",";
//	str_out += tag_out_proc_int ("population",unit_aa["population"]);
	str_out += tag_out_proc_string ("population",unit_aa["population"]);
	str_out += ",";
	str_out += tag_out_proc_string ("date_mod",unit_aa["date_mod"]);
	str_out +=  "}";

	return	str_out;
}

// -----------------------------------------------------------------------
string json_update_proc (string json_str,int population_in)
{
//	cout << key_str << "\t";
	object obj = json_record_parser (json_str);
	string name = obj["name"].to_str ();
	cout << name << "\t";
	string population = obj["population"].to_str ();
	cout << population << "\t";
	string date_mod = obj["date_mod"].to_str ();
	cout << date_mod << "\n";

	Unit unit_aa;
	unit_aa["name"] = obj["name"].to_str ();
	unit_aa["population"] = lexical_cast<string>(population_in);
	unit_aa["date_mod"] = get_current_date_proc ();
	string json_str_new = unit_to_json_proc (unit_aa);
	cout << json_str_new << endl;

	return	json_str_new;
}

// -----------------------------------------------------------------------
int get_riak_keys (string json_str,string keys[])
{
	object obj = json_record_parser (json_str);

//	cout << obj["keys"].to_str () << endl;

//	cout << obj["keys"] << endl;
//	cout << sizeof (obj["keys"]) << endl;

	picojson::value& cc = obj["keys"];

	int nn_keys = 0;
	picojson::array& a = cc.get<picojson ::array>();

	for (picojson::array::iterator it = a.begin(); it != a.end(); it++)
		{
		string key = it->get<string>();
//		cout << key << endl;

		keys[nn_keys] = key;
		nn_keys++;
    		}

	return	nn_keys;
}

// -----------------------------------------------------------------------
