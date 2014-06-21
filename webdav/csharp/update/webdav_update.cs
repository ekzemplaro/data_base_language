// ------------------------------------------------------------------
//	webdav_update.cs
//
//					May/21/2012
//
// ------------------------------------------------------------------
using	System;
using	System.Collections.Generic;

using Newtonsoft.Json;
// ------------------------------------------------------------------
public class webdav_update
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	id_in = args[0];
	int	population_in = int.Parse (args[1]);

	Console.WriteLine (id_in + "\t" + population_in);

	string url_target = "http://host_dbase:3004/city/tokyo.json";

	string user = "";
	string passwd = "";

	string str_json = get_uri.get_uri_proc (url_target,user,passwd);


	Dictionary <string,Object> dict_aa
		 = json_manipulate.json_to_dict_proc (str_json);

	dict_aa = text_manipulate.dict_update_proc
		(dict_aa,id_in,population_in);

	text_manipulate.dict_display_proc (dict_aa);

	string str_json_out = JsonConvert.SerializeObject (dict_aa);

//	Console.WriteLine (str_json_out);

	get_uri.put_uri_string_proc
			(url_target,str_json_out,user,passwd);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
