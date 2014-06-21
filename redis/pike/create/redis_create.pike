#! /usr/bin/pike
//
//	redis_create.pike
//
//						Aug/27/2011
//
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
#include "/var/www/data_base/common/pike_common/redis_manipulate.pike"
// ----------------------------------------------------------------
mapping(string:mapping(string:string)) data_prepare_proc ()
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	dict_aa =  dict_append_proc (dict_aa,"t1851","福井","54731","1920-3-12");
	dict_aa =  dict_append_proc (dict_aa,"t1852","敦賀","91356","1920-9-5");
	dict_aa =  dict_append_proc (dict_aa,"t1853","小浜","18392","1920-7-4");
	dict_aa =  dict_append_proc (dict_aa,"t1854","大野","39175","1920-6-9");
	dict_aa =  dict_append_proc (dict_aa,"t1855","勝山","37924","1920-3-2");
	dict_aa =  dict_append_proc (dict_aa,"t1856","鯖江","32867","1920-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t1857","あわら","18554","1920-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t1858","越前","18536","1920-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t1859","坂井","75468","1920-10-18");


	return	dict_aa;
}
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();

//	dict_display_proc (dict_aa);

	string host = "host_dbase";

	dict_to_redis_proc (dict_aa,host);

	write ("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
