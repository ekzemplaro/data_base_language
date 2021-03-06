// -----------------------------------------------------------------------
/*
	json_manipulate.cpp

					Jun/01/2018
*/
// -----------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<string>
#include	<boost/lexical_cast.hpp>

#include "json11.hpp"

// -----------------------------------------------------------------------
using namespace std;
using namespace boost;
using namespace json11;

typedef map<string,string> Unit;
extern string get_current_date_proc ();
// -----------------------------------------------------------------------
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);
// -----------------------------------------------------------------------
/*
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
*/
// -----------------------------------------------------------------------
map <string,Unit> json_to_dict_proc (string str_json)
{
	map <string,Unit> dict_aa;

	string err;
	auto json = Json::parse(str_json, err);

	if (!err.empty())
		{
		printf("Failed: %s\n", err.c_str());
		}
	else
		{
		for (auto &kk : json.object_items())
			{
			string key = kk.first.c_str();
			Unit unit_aa;
			for (auto &ll : kk.second.object_items())
				{
				string key_item = ll.first.c_str();
				string vvx = ll.second.string_value();

				if (vvx.length() == 0)
					{
					vvx = ll.second.dump().c_str();
					}
				unit_aa[key_item] = vvx;

				}
			dict_aa[key] = unit_aa;
			}
		}

	return	dict_aa;
}

// -----------------------------------------------------------------------
// [8]:
string dict_to_json_proc (map <string,Unit> dict_aa)
{
	int nnx = (unsigned int)dict_aa.size();

	Json::object my_json;

	map <string,Unit>:: iterator it = dict_aa.begin ();

	while (it != dict_aa.end ())
		{
		string key = (*it).first;
		Unit unit_aa = (*it).second;

		int population = atoi (unit_aa["population"].c_str ());

		my_json[key] = Json::object {{ "name", unit_aa["name"]},{ "population", population},{ "date_mod", unit_aa["date_mod"] }};

		it++;
		}

	Json data = my_json;

	string json_str = data.dump();

	return	json_str;
}

// -----------------------------------------------------------------------
Unit json_to_unit_proc (string json_str)
{
	Unit unit_aa;
	string err;

	auto json = Json::parse(json_str, err);

	if (!err.empty())
		{
		printf("Failed: %s\n", err.c_str());
		}
	else
		{
		for (auto &kk : json.object_items())
			{
			string key =  kk.first.c_str();
//			cout << "key = " << key << "\t";
//			cout << kk.second.dump().c_str() << "\n";
//			cout << typeid(kk.second).name() << "\n";
			string vvx = kk.second.string_value();

			if (vvx.length() == 0)
				{
				vvx = kk.second.dump().c_str();
				}

			unit_aa[key] = vvx;
			}
		}
/*
	object obj = json_record_parser (json_str);

	unit_aa["name"] = obj["name"].to_str ();
	unit_aa["population"] = obj["population"].to_str ();
	unit_aa["date_mod"] = obj["date_mod"].to_str ();
*/

	return	unit_aa;
}
// -----------------------------------------------------------------------
string unit_to_json_proc (Unit unit_aa)
{
	string str_out = "";

	Json::object my_json;

	int population = atoi (unit_aa["population"].c_str ());

	my_json = Json::object {{ "name", unit_aa["name"]},{ "population", population},{ "date_mod", unit_aa["date_mod"] }};

	Json data = my_json;

	string json_str = data.dump();

	return	json_str;
}

// -----------------------------------------------------------------------
string json_update_proc (string json_str,int population_in)
{
	Unit unit_aa = json_to_unit_proc (json_str);


	unit_aa["population"] = lexical_cast<string>(population_in);
	unit_aa["date_mod"] = get_current_date_proc ();

	string json_str_new = unit_to_json_proc (unit_aa);
/*
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
*/

	return	json_str_new;
}


// -----------------------------------------------------------------------
/*
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
*/

// -----------------------------------------------------------------------
