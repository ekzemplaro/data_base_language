// -------------------------------------------------------------------
/*
	xml_manipulate.d

						Jul/05/2011
*/
// -------------------------------------------------------------------
module	xml_manipulate;

import std.stdio;

// -------------------------------------------------------------------
string xml_unit_out_proc (string [string][string] dict_aa,string key)
{
	string [string] unit_aa = dict_aa[key];

//	string out_str = "<cities>\n";

	string out_str = "<" ~ key ~ ">\n"; 
	out_str ~= "\t<name>" ~ unit_aa["name"] ~ "</name>\n"; 
	out_str ~= "\t<population>" ~ unit_aa["population"] ~ "</population>\n"; 
	out_str ~= "\t<date_mod>" ~ unit_aa["date_mod"] ~ "</date_mod>\n"; 

	out_str ~= "</" ~ key ~ ">\n"; 

	return	out_str;
}


// -------------------------------------------------------------------
void xml_write_proc (string file_out,string [string][string]dict_aa)
{
	string	out_str = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
	out_str ~= "<root>\n";

	string[] keys_aa = dict_aa.keys;

	foreach (string key; keys_aa)
		{
		out_str ~= xml_unit_out_proc (dict_aa,key);
		}

	out_str ~= "</root>\n";
	std.file.write (file_out,out_str);
}

// -------------------------------------------------------------------
