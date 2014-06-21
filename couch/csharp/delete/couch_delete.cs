// ------------------------------------------------------------------
//	couch_delete.cs
//
//					Apr/10/2013
//
// ------------------------------------------------------------------
using System;
using System.IO;
using System.Text;
using System.Collections.Generic;

using Newtonsoft.Json;
// ------------------------------------------------------------------
public class couch_delete
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	key_in = args[0];

	Console.WriteLine (key_in);

	string url = "http://host_dbase:5984/city/cities";

	string user = "";
	string password = "";

	string str_json = get_uri.get_uri_proc (url,user,password);

	Dictionary <string,Object> dict_aa
		= JsonConvert.DeserializeObject
			<Dictionary <string,Object>> (str_json);

	Object idx = dict_aa["_id"];
	Object revx = dict_aa["_rev"];

	Console.WriteLine (idx);
	Console.WriteLine (revx);

	if (dict_aa.ContainsKey (key_in))
		{
		dict_aa.Remove (key_in);

		string str_json_out = JsonConvert.SerializeObject (dict_aa);

//	Console.WriteLine (str_json_out);

		get_uri.put_uri_string_proc (url,str_json_out,user,password);
		}

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
