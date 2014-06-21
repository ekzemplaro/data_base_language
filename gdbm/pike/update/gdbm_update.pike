#! /usr/bin/pike
//
//	gdbm_update.pike
//
//						Aug/26/2013
//
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
#include "/var/www/data_base/common/pike_common/gdbm_manipulate.pike"
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	string file_gdbm = argv[1];
	string key_in = argv[2];
	string population_in = argv[3];

	mapping(string:mapping(string:string)) dict_aa = gdbm_to_dict_proc (file_gdbm);

	dict_aa = dict_update_proc (dict_aa,key_in,population_in);

	dict_display_proc (dict_aa);

	dict_to_gdbm_proc (dict_aa,file_gdbm);

	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
