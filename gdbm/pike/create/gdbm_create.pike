#! /usr/bin/pike
//
//	gdbm_create.pike
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

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();
	dict_display_proc (dict_aa);

	dict_to_gdbm_proc (dict_aa,file_gdbm);

	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
mapping(string:mapping(string:string)) data_prepare_proc ()
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	dict_aa =  dict_append_proc (dict_aa,"t2151","岐阜","75431","1920-8-18");
	dict_aa =  dict_append_proc (dict_aa,"t2152","大垣","92356","1920-9-5");
	dict_aa =  dict_append_proc (dict_aa,"t2153","多治見","71832","1920-7-4");
	dict_aa =  dict_append_proc (dict_aa,"t2154","各務原","39175","1920-6-9");
	dict_aa =  dict_append_proc (dict_aa,"t2155","土岐","37624","1920-3-2");
	dict_aa =  dict_append_proc (dict_aa,"t2156","高山","12867","1920-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t2157","美濃加茂","92185","1920-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t2158","恵那","18536","1920-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t2159","関","75468","1920-5-19");

	return	dict_aa;
}

// ----------------------------------------------------------------
