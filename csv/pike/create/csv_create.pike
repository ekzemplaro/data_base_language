#! /usr/bin/pike
//
//	csv_create.pike
//
//						Jul/06/2011
//
// ----------------------------------------------------------------
import Stdio;
// ----------------------------------------------------------------
#include	"/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
mapping(string:mapping(string:string)) data_prepare_proc ()
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	dict_aa =  dict_append_proc (dict_aa,"t1271","千葉","71284","1964-5-22");
	dict_aa =  dict_append_proc (dict_aa,"t1272","勝浦","38756","1964-2-15");
	dict_aa =  dict_append_proc (dict_aa,"t1273","市原","81832","1964-7-9");
	dict_aa =  dict_append_proc (dict_aa,"t1274","流山","75387","1964-3-12");
	dict_aa =  dict_append_proc (dict_aa,"t1275","八千代","12492","1964-3-2");
	dict_aa =  dict_append_proc (dict_aa,"t1276","我孫子","34567","1964-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t1277","鴨川","51275","1964-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t1278","銚子","18536","1964-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t1279","市川","75421","1964-6-18");

	return	dict_aa;
}

// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write	("*** 開始 ***\n");

	string file_out = argv[1];

	write (file_out + "\n");

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();

	dict_display_proc (dict_aa);

	csv_write_proc (file_out,dict_aa);

	write	("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
