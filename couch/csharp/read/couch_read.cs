// ------------------------------------------------------------------
//	read/couch_read.cs
//
//					Oct/03/2011
//
// ------------------------------------------------------------------
using System;
using System.IO;
using System.Net;
using System.Text;
using System.Collections.Generic;

using Newtonsoft.Json;

// ------------------------------------------------------------------
public class couch_read
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string url = "http://host_dbase:5984/city/cities";

	string user = "";
	string password = "";

	string str_json = get_uri.get_uri_proc (url,user,password);
//	Console.WriteLine (str_json);

	Dictionary <string,Object> dict_aa
		 = json_manipulate.json_to_dict_proc (str_json);

	text_manipulate.dict_display_proc (dict_aa);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
