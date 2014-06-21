#! /usr/bin/pike
//
//	json_read.pike
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

	write (file_json + "\n");

	string json_str = Stdio.File(file_json)->read();

	mapping(string:mapping(string:string)) dict_aa
			= Standards.JSON.decode (json_str);

	dict_display_proc (dict_aa);

	write	("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
