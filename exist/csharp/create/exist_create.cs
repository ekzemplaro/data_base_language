// -------------------------------------------------------------------
/*
	exist_create.cs

					Sep/18/2011

*/
// -------------------------------------------------------------------
using	System;
using	System.Collections.Generic;

// ----------------------------------------------------------------
public static class	xml_create
{

// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	text_manipulate.dict_display_proc (dict_aa);

	string xml_str = xml_manipulate.dict_to_xml_proc (dict_aa);
 

	string url = @"http://localhost:8086/exist/rest/cities/cities.xml";

	string user="";
	string password="";

	get_uri.put_uri_string_proc (url,xml_str,user,password);

	Console.WriteLine("*** 終了 ***");
}

// --------------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4251",@"長崎",92451,"2009-2-24");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4252",@"佐世保",32894,"2009-3-17");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4253",@"島原",78513,"2009-4-22");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4254",@"大村",37492,"2009-1-12");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4255",@"諫早",91567,"2009-4-25");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4256",@"五島",21539,"2009-3-7");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4257",@"平戸",74592,"2009-7-21");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4258",@"雲仙",38926,"2009-5-7");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4259",@"松浦",52561,"2009-3-11");

	return	dict_aa;

}

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
