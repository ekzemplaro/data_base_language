#! /usr/bin/pike
//
//	exist_create.pike
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

	dict_aa =  dict_append_proc (dict_aa,"t4251","長崎","85472","1920-5-12");
	dict_aa =  dict_append_proc (dict_aa,"t4252","佐世保","35681","1920-9-5");
	dict_aa =  dict_append_proc (dict_aa,"t4253","島原","83294","1920-7-4");
	dict_aa =  dict_append_proc (dict_aa,"t4254","大村","39175","1920-6-9");
	dict_aa =  dict_append_proc (dict_aa,"t4255","諫早","37924","1920-3-2");
	dict_aa =  dict_append_proc (dict_aa,"t4256","五島","32867","1920-5-7");
	dict_aa =  dict_append_proc (dict_aa,"t4257","平戸","56275","1920-8-12");
	dict_aa =  dict_append_proc (dict_aa,"t4258","雲仙","18536","1920-4-15");
	dict_aa =  dict_append_proc (dict_aa,"t4259","松浦","75421","1920-6-18");


	return	dict_aa;
}
// ----------------------------------------------------------------
int main (int argc, array(string) argv)
{
	write ("*** 開始 ***\n");

	mapping(string:mapping(string:string)) dict_aa = data_prepare_proc ();

	dict_display_proc (dict_aa);

	string str_xml = dict_to_xml_proc (dict_aa);

	string url_in = "http://localhost:8086/exist/rest/db/cities/cities.xml";

	Protocols.HTTP.put_url (url_in,str_xml);
  
	write ("*** 終了 ***\n");
	return 0;
}

// ----------------------------------------------------------------
