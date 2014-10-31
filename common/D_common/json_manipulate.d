// -------------------------------------------------------------------
/*
	json_manipulate.d

						Oct/22/2014
*/
// -------------------------------------------------------------------
module	json_manipulate;

import std.stdio;
import std.json;
import	std.conv;

import	text_manipulate; 
// -------------------------------------------------------------------
JSONValue json_unit_out_proc (string [string][string] dict_aa,string key)
{
	string [string] unit_aa = dict_aa[key];

	JSONValue json_unit;
 
	json_unit.object["name"] = JSONValue();
	json_unit.object["name"].str = unit_aa["name"] ;

	json_unit.object["population"] = JSONValue();
	json_unit.object["population"].str = unit_aa["population"] ;

	json_unit.object["date_mod"] = JSONValue();
//	json_unit.object["date_mod"].type = JSON_TYPE.STRING;
	json_unit.object["date_mod"].str = unit_aa["date_mod"] ;

	return	json_unit;
}

// -------------------------------------------------------------------
string	dict_to_json_proc (string [string][string]dict_aa)
{

	string[] keys_aa = dict_aa.keys;
	JSONValue json;

	foreach (string key; keys_aa)
		{
		JSONValue json_unit = json_unit_out_proc (dict_aa,key);
		json.object[key] = JSONValue();
		json.object[key] = json_unit;
		}

	string out_str = (&json).toJSON();

	return	out_str;
}

// -------------------------------------------------------------------
string [string] [string] json_to_dict_proc (string json_str)
{
	string [string] [string] dict_aa;

	auto json = parseJSON (json_str);

	switch (json.type) {
		case JSON_TYPE.OBJECT:
			foreach (key, unit_json; json.object) {
			string [string] unit_bb =
				record_parse_proc (unit_json);
			dict_aa = dict_append_proc
		(dict_aa,key,unit_bb["name"],unit_bb["population"],unit_bb["date_mod"]);
				}
		break;

		default:
			break;
		}

	return	dict_aa;
}

// -------------------------------------------------------------------
string [string] record_parse_proc (JSONValue unit_aa)
{
	string [string] unit_out;

	foreach(key_bb, value_bb; unit_aa.object) {
		switch (value_bb.type)
			{
			case JSON_TYPE.STRING:
				unit_out[key_bb] = value_bb.str;
				break;

			case JSON_TYPE.INTEGER:
				ulong iix = value_bb.integer;
				unit_out[key_bb] = text (iix);
				break;
		default:
			break;
			}
		}

	return	unit_out;
}

// -------------------------------------------------------------------
string json_update_proc (string json_str,string population_in)
{
	auto json = parseJSON (json_str);

	string[string] unit_aa = record_parse_proc (json);

	writeln (unit_aa["name"]);

	unit_aa["population"] = population_in;
	unit_aa["date_mod"] = get_current_date_proc ();

	string json_str_new = unit_to_json_str_proc (unit_aa);

	return	json_str_new;
}

// -------------------------------------------------------------------
string unit_to_json_str_proc (string[string] unit_aa)
{
	JSONValue json_new;

	json_new.object["name"] = JSONValue();
	json_new.object["name"].str = unit_aa["name"] ;

	json_new.object["population"] = JSONValue();
	json_new.object["population"].str = unit_aa["population"] ;

	json_new.object["date_mod"] = JSONValue();
	json_new.object["date_mod"].str = unit_aa["date_mod"] ;

	string json_str_new = (&json_new).toJSON();

	return	json_str_new;
}

// -------------------------------------------------------------------
