// ------------------------------------------------------------------
//	ftp_delete.cs
//
//					Jan/18/2012
//
// ------------------------------------------------------------------
using System;
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

	Console.WriteLine (key_in);

	string url = "ftp://host_dbase/city/iwate.json";

	string user = "scott";
	string passwd = "tiger";

	string str_json = ftp_manipulate.ftp_to_str_proc (url,user,passwd);

	Dictionary <string,Object> dict_aa
		 = json_manipulate.json_to_dict_proc (str_json);

	if (dict_aa.ContainsKey (key_in))
		{
		dict_aa.Remove (key_in);

		text_manipulate.dict_display_proc (dict_aa);

		string str_json_out = JsonConvert.SerializeObject (dict_aa);

//	Console.WriteLine (str_json_out);

		ftp_manipulate.str_to_ftp_proc (url,user,passwd,str_json_out);
		}

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
