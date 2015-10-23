// ------------------------------------------------------------------
//	webdav_read.cs
//
//					Jan/23/2012
//
// ------------------------------------------------------------------
using	System;
using	System.Collections.Generic;

// ------------------------------------------------------------------
public class webdav_read
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string url = "http://host_dbase:3004/city/tokyo.json";

	string user = "";
	string password = "";

	string str_json = get_uri.get_uri_proc (url,user,password);

	Dictionary <string,Object> dict_aa
		 = json_manipulate.json_to_dict_proc (str_json);

	text_manipulate.dict_display_proc (dict_aa);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
