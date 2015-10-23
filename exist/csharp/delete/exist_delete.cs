// ------------------------------------------------------------------
//	exist_delete.cs
//
//					Sep/18/2011
//
// ------------------------------------------------------------------
using System;
using System.Collections.Generic;

// ------------------------------------------------------------------
public class exist_delete
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string key = args[0];

	Console.WriteLine (key);

	string url = @"http://localhost:8086/exist/rest/cities/cities.xml";

	string user="";
	string password="";

	Console.WriteLine (url);

	string str_xml = get_uri.get_uri_proc (url,user,password);

	Dictionary <string,Object> dict_aa
		 = xml_manipulate.xml_to_dict_proc (str_xml);

	dict_aa.Remove (key);

	text_manipulate.dict_display_proc (dict_aa);

	string xml_str = xml_manipulate.dict_to_xml_proc (dict_aa);

	get_uri.put_uri_string_proc (url,xml_str,user,password);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
