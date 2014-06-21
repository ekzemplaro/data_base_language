#! /usr/bin/pike
//
//	xindice_create.pike
//
//						Oct/05/2011
//
// ----------------------------------------------------------------
import Stdio;
// ----------------------------------------------------------------
#include "/var/www/data_base/common/pike_common/text_manipulate.pike"
#include "/var/www/data_base/common/pike_common/xml_manipulate.pike"
// ----------------------------------------------------------------
mapping(string:mapping(string:string)) data_prepare_proc ()
{
	mapping(string:mapping(string:string)) dict_aa = ([]);

	dict_aa =  dict_append_proc (dict_aa,"t0271","青森","57285","1920-3-12");
	dict_aa =  dict_append_proc (dict_aa,"t0272","弘前","92356","1920-9-5");
	dict_aa =  dict_append_proc (dict_aa,"t0273","八戸","81832","1920-7-4");
	dict_aa =  dict_append_proc (dict_aa,"t0274","三沢","39175","1920-6-9");
	dict_aa =  dict_append_proc (dict_aa,"t0275","黒石","37924","1920-3-2");
	dict_aa =  dict_append_proc (dict_aa,"t0276","むつ","32867","1920-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t0277","五所川原","56275","1920-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t0278","十和田","18536","1920-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t0279","平川","75421","1920-6-18");


	return	dict_aa;
}
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();

	dict_display_proc (dict_aa);

	string str_xml = dict_to_xml_proc (dict_aa);

	string url_in = "http://host_xindice:8888/xindice/db/cities/cities";

	Protocols.HTTP.put_url (url_in,str_xml);
  
	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
