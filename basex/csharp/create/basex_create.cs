// ----------------------------------------------------------------
/*
	basex_create.cs

					Oct/28/2011

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

	string url = @"http://localhost:8984/rest/cities";

	string user="admin";
	string password="admin";

	get_uri.put_uri_string_proc (url,xml_str,user,password);

	Console.WriteLine("*** 終了 ***");
}

// --------------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4161",@"佐賀",28157,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4162",@"唐津",87653,"2009-5-27");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4163",@"鳥栖",78157,"2009-4-22");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4164",@"多久",37842,"2009-1-12");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4165",@"伊万里",95719,"2009-4-25");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4166",@"武雄",21956,"2009-3-7");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4167",@"鹿島",75934,"2009-7-21");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4168",@"小城",31982,"2009-5-7");
	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t4169",@"嬉野",52527,"2009-3-11");

	return	dict_aa;

}

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
