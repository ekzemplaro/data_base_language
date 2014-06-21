#! /usr/bin/pike
//
//	xml_create.pike
//
//						Aug/21/2011
//
// ----------------------------------------------------------------
import Stdio;
// ----------------------------------------------------------------
#include	"/var/www/data_base/common/pike_common/text_manipulate.pike"
#include	"/var/www/data_base/common/pike_common/xml_manipulate.pike"
// ----------------------------------------------------------------
mapping(string:mapping(string:string)) data_prepare_proc ()
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	dict_aa =  dict_append_proc (dict_aa,"t2261","静岡","58942","1920-5-12");
	dict_aa =  dict_append_proc (dict_aa,"t2262","浜松","31627","1920-8-5");
	dict_aa =  dict_append_proc (dict_aa,"t2263","沼津","19831","1920-7-4");
	dict_aa =  dict_append_proc (dict_aa,"t2264","三島","57814","1920-6-9");
	dict_aa =  dict_append_proc (dict_aa,"t2265","富士","26921","1920-3-2");
	dict_aa =  dict_append_proc (dict_aa,"t2266","熱海","31567","1920-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t2267","富士宮","52765","1920-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t2268","藤枝","18536","1920-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t2269","御殿場","75429","1920-6-18");
	dict_aa =  dict_append_proc (dict_aa,"t2270","島田","42136","1920-9-21");

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

	string str_xml = dict_to_xml_proc (dict_aa);

	write_file (file_out,str_xml,0777);


	write	("*** 終了 ***\n");

	return 0;
}

// ----------------------------------------------------------------
