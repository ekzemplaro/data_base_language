#! /usr/bin/pike
//
//	text_create.pike
//
//						Sep/06/2016
//
// ----------------------------------------------------------------
import Stdio;
// ----------------------------------------------------------------
#include	"/var/www/data_base/common/pike_common/text_manipulate.pike"
// ----------------------------------------------------------------
mapping(string:mapping(string:string)) data_prepare_proc ()
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	dict_aa =  dict_append_proc (dict_aa,"t2381","名古屋","85431","1920-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t2382","豊橋","92356","1920-2-5");
	dict_aa =  dict_append_proc (dict_aa,"t2383","岡崎","51832","1920-7-4");
	dict_aa =  dict_append_proc (dict_aa,"t2384","一宮","39175","1920-6-9");
	dict_aa =  dict_append_proc (dict_aa,"t2385","蒲郡","37924","1920-3-2");
	dict_aa =  dict_append_proc (dict_aa,"t2386","常滑","32867","1920-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t2387","大府","52386","1920-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t2388","瀬戸","18536","1920-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t2389","犬山","75468","1920-10-18");

	return	dict_aa;
}

// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write	("*** 開始 ***\n");

	string file_out = argv[1];

	write (file_out + "\n");

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();

	text_write_proc (file_out,dict_aa);

	write	("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
