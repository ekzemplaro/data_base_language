// ----------------------------------------------------------------
/*
	xindice_create.cs

					Sep/18/2011

*/
// ----------------------------------------------------------------
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

	string url = @"http://host_dbase:8888/xindice/db/cities/cities";

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
		(dict_aa,"t0271",@"青森",96281,"2009-8-4");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0272",@"弘前",87653,"2009-5-27");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0273",@"八戸",78157,"2009-4-22");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0274",@"三沢",37842,"2009-1-12");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0275",@"黒石",95719,"2009-4-25");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0276",@"むつ",21956,"2009-3-7");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0277",@"五所川原",75934,"2009-7-21");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0278",@"十和田",31982,"2009-5-7");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0279",@"平川",52527,"2009-3-11");

	return	dict_aa;

}

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
