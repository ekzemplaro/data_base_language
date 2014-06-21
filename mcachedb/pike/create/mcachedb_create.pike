#! /usr/bin/pike
//
//	mcachedb_create.pike
//
//						Aug/27/2011
//
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
#include "/var/www/data_base/common/pike_common/mcached_manipulate.pike"
// ----------------------------------------------------------------
mapping(string:mapping(string:string)) data_prepare_proc ()
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	dict_aa =  dict_append_proc (dict_aa,"t1521","新潟","82439","1920-5-8");
	dict_aa =  dict_append_proc (dict_aa,"t1522","長岡","71356","1920-3-5");
	dict_aa =  dict_append_proc (dict_aa,"t1523","新発田","15732","1920-7-4");
	dict_aa =  dict_append_proc (dict_aa,"t1524","上越","39175","1920-6-9");
	dict_aa =  dict_append_proc (dict_aa,"t1525","糸魚川","37924","1920-3-2");
	dict_aa =  dict_append_proc (dict_aa,"t1526","加茂","32867","1920-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t1527","三条","91235","1920-4-12");
	dict_aa =  dict_append_proc (dict_aa,"t1528","佐渡","18536","1920-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t1529","柏崎","75468","1920-10-18");
	dict_aa =  dict_append_proc (dict_aa,"t1530","村上","46821","1920-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t1531","十日町","21594","1920-8-4");
	dict_aa =  dict_append_proc (dict_aa,"t1532","五泉","21379","1920-3-21");


	return	dict_aa;
}
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();

//	dict_display_proc (dict_aa);

	int port = 21201;

	dict_to_port_proc (dict_aa,port);

	write ("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
