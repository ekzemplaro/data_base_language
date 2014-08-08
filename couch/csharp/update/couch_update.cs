// ------------------------------------------------------------------
//	couch_update.cs
//
//					Jul/24/2014
//
// ------------------------------------------------------------------
using System;
using System.IO;
using System.Text;
using System.Collections.Generic;

using Newtonsoft.Json;
// ------------------------------------------------------------------
public class couch_update
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	key_in = args[0];
	int	population_in = int.Parse (args[1]);

	Console.WriteLine (key_in + "\t" + population_in);

	string url = "http://localhost:5984/nagano";
	string url_target = url + "/" + key_in;

	string user = "";
	string password = "";

	string str_json = get_uri.get_uri_proc (url_target,user,password);

/*

Dictionary <string,Object> unit_aa
		= JsonConvert.DeserializeObject
			<Dictionary <string,Object>> (str_json);

	Object idx = unit_aa["_id"];
	Object revx = unit_aa["_rev"];

	Console.WriteLine (idx);
	Console.WriteLine (revx);
*/

	String json_new = kvalue_manipulate.json_update_proc
			(key_in,population_in,str_json);

	get_uri.put_uri_string_proc (url_target,json_new,user,password);

	Console.WriteLine (json_new);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
