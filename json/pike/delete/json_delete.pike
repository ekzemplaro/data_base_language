#! /usr/bin/pike
//
//	json_delete.pike
//
//						Sep/06/2016
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

	write (file_json + "\n");
	write (key + "\n");

	string json_str = Stdio.File(file_json)->read();

	mapping(string:mapping(string:string)) dict_aa
			= Standards.JSON.decode (json_str);

	m_delete (dict_aa, key);

	string json_str_out = Standards.JSON.encode(dict_aa);

	write_file (file_json,json_str_out,0777);

	write	("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
