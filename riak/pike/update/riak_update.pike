#! /usr/bin/pike
//
//	riak_update.pike
//
//						Aug/30/2013
//
// ----------------------------------------------------------------
import Stdio;

#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string key = argv[1];
	string population_in = argv[2];

	write (key + "\t");
	write (population_in + "\n");

	string url_shimane = "http://localhost:8098/riak/shimane";
	string url_target = url_shimane + "/" + key;

	string str_unit =Protocols.HTTP.get_url_data (url_target);
	mapping(string:string) unit_aa
			= Standards.JSON.decode (str_unit);

	unit_aa["population"] = population_in;

	unit_aa["date_mod"] = get_current_date_proc ();

	string json_str = Standards.JSON.encode(unit_aa);

	write (string_to_utf8 (json_str) + "\n");

	string file_tmp = "/tmp/tmp0045.json";

	write_file (file_tmp,string_to_utf8 (json_str,0777));

	object resp=Protocols.HTTP.put_url (url_target,file_tmp);
 
//	write (resp);

	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
