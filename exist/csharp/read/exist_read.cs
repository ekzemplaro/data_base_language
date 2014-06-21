// ------------------------------------------------------------------
//	exist_read.cs
//
//					Sep/18/2011
//
// ------------------------------------------------------------------
using System;
using System.Collections.Generic;

// ------------------------------------------------------------------
public class exist_read
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string url = @"http://localhost:8086/exist/rest/cities/cities.xml";

	string user="";
	string password="";

	Console.WriteLine (url);

	string str_xml = get_uri.get_uri_proc (url,user,password);

	Dictionary <string,Object> dict_aa
		 = xml_manipulate.xml_to_dict_proc (str_xml);

	text_manipulate.dict_display_proc (dict_aa);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
