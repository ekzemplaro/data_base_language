// ------------------------------------------------------------------
//	basex_read.cs
//
//					Oct/28/2011
//
// ------------------------------------------------------------------
using System;
using System.Collections.Generic;
// ------------------------------------------------------------------
public class xindice_read
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string url = "http://localhost:8984/rest/cities?query=/";

	Console.WriteLine (url);

	string user = "admin";
	string password = "admin";

	string str_xml = get_uri.get_uri_proc (url,user,password);

	Dictionary <string,Object> dict_aa
		 = xml_manipulate.xml_to_dict_proc (str_xml);

	text_manipulate.dict_display_proc (dict_aa);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
