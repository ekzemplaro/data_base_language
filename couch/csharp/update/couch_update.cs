// ------------------------------------------------------------------
//	couch_update.cs
//
//					Aug/02/2011
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

	string	id_in = args[0];
	int	population_in = int.Parse (args[1]);

	Console.WriteLine (id_in + "\t" + population_in);

	string url = "http://host_dbase:5984/city/cities";

	string user = "";
	string password = "";

	string str_json = get_uri.get_uri_proc (url,user,password);


Dictionary <string,Object> dict_bb
		= JsonConvert.DeserializeObject
			<Dictionary <string,Object>> (str_json);

	Object idx = dict_bb["_id"];
	Object revx = dict_bb["_rev"];

	Console.WriteLine (idx);
	Console.WriteLine (revx);

	dict_bb.Remove ("_id");
	dict_bb.Remove ("_rev");

	string str_json_bb = JsonConvert.SerializeObject (dict_bb);

	Dictionary <string,Object> dict_aa
		 = json_manipulate.json_to_dict_proc (str_json_bb);

	dict_aa = text_manipulate.dict_update_proc
		(dict_aa,id_in,population_in);

	text_manipulate.dict_display_proc (dict_aa);

	dict_aa["_id"] = idx;
	dict_aa["_rev"] = revx;

	string str_json_out = JsonConvert.SerializeObject (dict_aa);

//	Console.WriteLine (str_json_out);

	get_uri.put_uri_string_proc (url,str_json_out,user,password);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
