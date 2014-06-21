// ------------------------------------------------------------------
//	ftp_update.cs
//
//					Oct/18/2011
//
// ------------------------------------------------------------------
using	System;
using	System.Collections.Generic;

using Newtonsoft.Json;
// ------------------------------------------------------------------
public class couch_update
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	id_in = args[0];
	int	population_in = int.Parse (args[1]);

	Console.WriteLine (id_in + "\t" + population_in);

	string url = "ftp://host_dbase/city/iwate.json";

	string user = "scott";
	string passwd = "tiger";

	string str_json = ftp_manipulate.ftp_to_str_proc (url,user,passwd);


	Dictionary <string,Object> dict_aa
		 = json_manipulate.json_to_dict_proc (str_json);

	dict_aa = text_manipulate.dict_update_proc
		(dict_aa,id_in,population_in);

	text_manipulate.dict_display_proc (dict_aa);

	string str_json_out = JsonConvert.SerializeObject (dict_aa);

//	Console.WriteLine (str_json_out);

	ftp_manipulate.str_to_ftp_proc (url,user,passwd,str_json_out);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
