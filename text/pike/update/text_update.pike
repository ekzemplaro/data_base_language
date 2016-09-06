#! /usr/bin/pike
//
//	text_update.pike
//
//						Sep/06/2016
//
// ----------------------------------------------------------------
import Stdio;
// ----------------------------------------------------------------
#include	"/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write	("*** 開始 ***\n");

	string file_txt = argv[1];
	string id_in = argv[2];
	string population_in = argv[3];

	write (file_txt + "\n");
	write (id_in + "\t");
	write (population_in + "\n");

	mapping(string:mapping(string:string)) dict_aa
			= text_read_proc (file_txt);

	dict_aa = dict_update_proc (dict_aa,id_in,population_in);

	text_write_proc (file_txt,dict_aa);

	write	("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
