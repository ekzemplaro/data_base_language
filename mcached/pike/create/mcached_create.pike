#! /usr/bin/pike
//
//	mcached_create.pike
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

	dict_aa =  dict_append_proc (dict_aa,"t1731","金沢","82439","1920-5-8");
	dict_aa =  dict_append_proc (dict_aa,"t1732","輪島","71356","1920-3-5");
	dict_aa =  dict_append_proc (dict_aa,"t1733","小松","15732","1920-7-4");
	dict_aa =  dict_append_proc (dict_aa,"t1734","七尾","39175","1920-6-9");
	dict_aa =  dict_append_proc (dict_aa,"t1735","珠洲","37924","1920-3-2");
	dict_aa =  dict_append_proc (dict_aa,"t1736","加賀","32867","1920-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t1737","羽咋","91235","1920-4-12");
	dict_aa =  dict_append_proc (dict_aa,"t1738","かほく","18536","1920-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t1739","白山","75468","1920-10-18");


	return	dict_aa;
}
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();

//	dict_display_proc (dict_aa);

	int port = 11211;

	dict_to_port_proc (dict_aa,port);

	write ("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
