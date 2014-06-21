#! /usr/bin/pike
//
//	json_update.pike
//
//						Aug/22/2013
//
// ----------------------------------------------------------------
import Stdio;
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write	("*** 開始 ***\n");

	string file_json = argv[1];
	string key = argv[2];
	string population_in = argv[3];

	write (file_json + "\n");
	write (key + "\t");
	write (population_in + "\n");

	string json_str = Stdio.File(file_json)->read();

	mapping(string:mapping(string:string)) dict_aa
			= Standards.JSON.decode (json_str);

	dict_aa = dict_update_proc (dict_aa,key,population_in);

	dict_display_proc (dict_aa);

	string json_str_out = Standards.JSON.encode(dict_aa);

	write_file (file_json,json_str_out,0777);

	write	("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
