#! /usr/bin/pike
//
//	riak_read.pike
//
//						Aug/22/2013
//
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string url_shimane = "http://localhost:8098/riak/shimane";
	string url_in = url_shimane + "?keys=true";

	string content=Protocols.HTTP.get_url_data (url_in);
 
	mapping(string:mapping(string:string)) data_aa
			= Standards.JSON.decode (content);

	mapping(string:mapping(string:string)) dict_aa = ([]);

	for (int it =0; it< sizeof (data_aa["keys"]); it++)
		{
		string key = data_aa["keys"][it];
		string url_city = url_shimane + "/" + key;
		string str_unit =Protocols.HTTP.get_url_data (url_city);
		mapping(string:string) unit_aa
			= Standards.JSON.decode (str_unit);
		string name = string_to_utf8 (unit_aa["name"]);
		string population = (string)unit_aa["population"];
		string date_mod = unit_aa["date_mod"];
		dict_aa =  dict_append_proc (dict_aa,key,name,population,date_mod);
		}

	dict_display_proc (dict_aa);
 
	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
