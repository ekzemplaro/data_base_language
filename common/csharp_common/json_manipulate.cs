// --------------------------------------------------------------------
/*
	json_manipulate.cs

				Feb/27/2012


*/
// --------------------------------------------------------------------
using	System;
using	System.IO;
using	System.Collections.Generic;

using	Newtonsoft.Json;

// --------------------------------------------------------------------
public class	json_manipulate
{
// --------------------------------------------------------------------
public static Dictionary <string,Object>
	json_to_dict_proc (String str_json)
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	Dictionary <string,Object> dict_bb
		= JsonConvert.DeserializeObject
		<Dictionary <string,Object>> (str_json);

	foreach (KeyValuePair<string, Object> kv in dict_bb)
		{
		if ((kv.Key != "_id") && (kv.Key != "_rev"))
			{
			Dictionary <string,string> unit_aa
				= JsonConvert.DeserializeObject
				<Dictionary <string,string>> (kv.Value.ToString ());

			dict_aa = text_manipulate.dict_append_proc
				(dict_aa,kv.Key,unit_aa["name"],
					int.Parse (unit_aa["population"]),
					unit_aa["date_mod"]);
			}
		else
			{
			dict_aa[kv.Key] = kv.Value;
			}
		}


	return	dict_aa;
}

// --------------------------------------------------------------------
}

// --------------------------------------------------------------------
