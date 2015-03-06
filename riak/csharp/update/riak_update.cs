// ------------------------------------------------------------------
//	riak_update.cs
//
//					Feb/09/2015
//
// ------------------------------------------------------------------
using System;
using System.IO;
using System.Text;
using System.Collections.Generic;

using Newtonsoft.Json;
// ------------------------------------------------------------------
public class riak_update
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	String	key_in = args[0];
	int	population_in = int.Parse (args[1]);

	Console.WriteLine (key_in + "\t" + population_in);

	String url_base = "http://host_ubuntu1:8098/riak/shimane";

	String user = "";
	String password = "";

	String url_in = url_base + "?keys=true";

	String str_json = get_uri.get_uri_proc (url_in,user,password);

	Dictionary <String,Object> data_aa
		= JsonConvert.DeserializeObject
			<Dictionary <String,Object>> (str_json);

	Object json_str_keys = data_aa["keys"];

	String[] keys = JsonConvert.DeserializeObject
				<String[]> (json_str_keys.ToString ());

	Console.WriteLine (Array.IndexOf (keys,key_in));
	if (Array.IndexOf (keys,key_in) != -1)
		{
		Console.WriteLine (key_in);

		String url_target = url_base + "/" + key_in;

		String str_city = get_uri.get_uri_proc (url_target,user,password);
		Dictionary <String,Object> unit_aa
		= JsonConvert.DeserializeObject
			<Dictionary <String,Object>> (str_city);
		Console.WriteLine (unit_aa["name"]);

		unit_aa["population"] = population_in;
		DateTime dateNow = DateTime.Now;
		unit_aa["date_mod"] = dateNow.ToString ();
		String json_city = JsonConvert.SerializeObject (unit_aa);
		Console.WriteLine (json_city);
		get_uri.put_uri_string_proc (url_target,json_city,user,password);
		}
	else
		{
		Console.WriteLine (key_in + " doesn't exist.");
		}

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
