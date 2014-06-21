#! /usr/bin/pike
//
//	tyrant_create.pike
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

	dict_aa =  dict_append_proc (dict_aa,"t4761","那覇","43926","1920-9-8");
	dict_aa =  dict_append_proc (dict_aa,"t4762","宜野湾","35681","1920-4-5");
	dict_aa =  dict_append_proc (dict_aa,"t4763","石垣","73264","1920-2-4");
	dict_aa =  dict_append_proc (dict_aa,"t4764","浦添","39175","1920-6-9");
	dict_aa =  dict_append_proc (dict_aa,"t4765","名護","37924","1920-3-2");
	dict_aa =  dict_append_proc (dict_aa,"t4766","糸満","32867","1920-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t4767","沖縄","91235","1920-4-12");
	dict_aa =  dict_append_proc (dict_aa,"t4768","豊見城","18536","1920-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t4769","うるま","75468","1920-10-18");


	return	dict_aa;
}
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();

//	dict_display_proc (dict_aa);

	int port = 1978;

	dict_to_port_proc (dict_aa,port);

	write ("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
