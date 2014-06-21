#! /usr/bin/pike
//
//	basex_create.pike
//
//						Feb/02/2012
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

	dict_aa =  dict_append_proc (dict_aa,"t4161","佐賀","58437","1964-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t4162","唐津","92356","1964-9-5");
	dict_aa =  dict_append_proc (dict_aa,"t4163","鳥栖","81832","1964-7-4");
	dict_aa =  dict_append_proc (dict_aa,"t4164","多久","39175","1964-6-9");
	dict_aa =  dict_append_proc (dict_aa,"t4165","伊万里","37924","1964-3-2");
	dict_aa =  dict_append_proc (dict_aa,"t4166","武雄","32867","1964-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t4167","鹿島","56275","1964-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t4168","小城","18536","1964-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t4169","嬉野","75421","1964-6-18");


	return	dict_aa;
}
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();

	dict_display_proc (dict_aa);

	string str_xml = dict_to_xml_proc (dict_aa);

	string url_in = "http://admin:admin@localhost:8984/rest/cities";

	Protocols.HTTP.put_url (url_in,str_xml);
  
	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
