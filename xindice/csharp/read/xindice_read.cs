// ------------------------------------------------------------------
//	xindice_read.cs
//
//					Sep/18/2011
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

	string url = "http://cdbd026:8888/xindice/db/cities/cities";

	Console.WriteLine (url);

	string user = "";
	string password = "";

	string str_xml = get_uri.get_uri_proc (url,user,password);

	Dictionary <string,Object> dict_aa
		 = xml_manipulate.xml_to_dict_proc (str_xml);

	text_manipulate.dict_display_proc (dict_aa);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
