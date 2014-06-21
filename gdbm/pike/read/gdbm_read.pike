#! /usr/bin/pike
//
//	gdbm_read.pike
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

	mapping(string:mapping(string:string)) dict_aa = gdbm_to_dict_proc (file_gdbm);


	dict_display_proc (dict_aa);

	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
