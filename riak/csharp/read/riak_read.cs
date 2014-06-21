// ------------------------------------------------------------------
//	read/riak_read.cs
//
//					Apr/09/2013
//
// ------------------------------------------------------------------
using System;
using System.IO;
using System.Net;
using System.Text;
using System.Collections.Generic;

using Newtonsoft.Json;

// ------------------------------------------------------------------
public class riak_read
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	String url_base = "http://localhost:8098/riak/shimane";

	String url_in = url_base + "?keys=true";

	String user = "";
	String password = "";

	String str_json = get_uri.get_uri_proc (url_in,user,password);

	Dictionary <String,Object> data_aa
		= JsonConvert.DeserializeObject
		<Dictionary <String,Object>> (str_json);


	Object json_str_keys = data_aa["keys"];

	String[] keys = JsonConvert.DeserializeObject
				<String[]> (json_str_keys.ToString ());
	foreach (String key in keys)
		{
		String url_city  = url_base + "/" + key;
		String str_city = get_uri.get_uri_proc (url_city,user,password);
		Dictionary <String,Object> unit_aa
		= JsonConvert.DeserializeObject
			<Dictionary <String,Object>> (str_city);
		Console.Write (key + "\t");
		Console.Write (unit_aa["name"] + "\t");
		Console.Write (unit_aa["population"] + "\t");
		Console.WriteLine (unit_aa["date_mod"]);
		}


/*
	Dictionary <string,Object> dict_aa
		 = json_manipulate.json_to_dict_proc (str_json);

	text_manipulate.dict_display_proc (dict_aa);
*/
	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
