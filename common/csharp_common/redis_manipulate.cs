// ----------------------------------------------------------------
//	redis_manipulate.cs
//
//
//					Oct/04/2011
//
// ----------------------------------------------------------------
using System;

using System.Collections.Generic;

using	Newtonsoft.Json;
// ----------------------------------------------------------------
public class redis_manipulate
{

// ----------------------------------------------------------------
public static Dictionary <string,Object> redis_to_dict_proc (Redis rd)
{
	Dictionary <string,Object> dict_aa = new Dictionary <string,Object> ();

	List <String> keys = new List <String> ()
		{"t1851","t1852","t1853","t1854","t1855",
		"t1856","t1857","t1858","t1859"};

	foreach (String key in keys)
		{
		String json_str = null;

		try
			{
			json_str = rd.GetString (key);

			if (json_str != null)
				{
	Dictionary<String,Object> unit_bb
		= JsonConvert.DeserializeObject
			 <Dictionary<String,Object>> (json_str);

//			Console.WriteLine (unit_bb["name"]);
			int population = int.Parse (unit_bb["population"].ToString ());

			dict_aa = text_manipulate.dict_append_proc
				(dict_aa,key,unit_bb["name"].ToString (),
				population,unit_bb["date_mod"].ToString ());
				}
			}
		catch	(Exception exp)
			{
//		Console.Error.WriteLine ("*** error *** " + exp);
			}

		}
	return	dict_aa;
}

// ----------------------------------------------------------------
public static void update_proc (Redis rd,String key,int population_in)
{
	String json_str = rd.GetString (key);

	String json_new = kvalue_manipulate.json_update_proc
			(key,population_in,json_str);

	rd.Set (key, json_new);

}

// ----------------------------------------------------------------
public static string get_json_proc
	(Redis rd,int id_min,int id_max)
{
	string json_str = "{\"cities\":[";

	for (int id=id_min; id <= id_max; id++)
		{
		json_str += get_record_proc (rd,id);
		}

	int llx = json_str.Length;


	string tmp = json_str.Substring(0,llx-2);

	json_str = tmp +  "}]}";

	return	json_str;
}

// ----------------------------------------------------------------
static string get_record_proc (Redis rd,int key)
{
	string str_key = key.ToString ();
	string json_str = "";

	try
		{
		string json_str_aa = rd.GetString (str_key);

		if (json_str_aa != null)
				{
				json_str = "{\"id\":" + str_key + ",";
				json_str += json_str_aa.Substring (1);
				json_str += ",";
				}
		}
	catch	(Exception exp)
		{
//		Console.Error.WriteLine ("*** error *** " + exp);
		}

	return json_str;
}

// ----------------------------------------------------------------
public static void redis_set_proc
	(Redis rd,int id,String name,int population,String date_mod)
{
	String json_new = kvalue_manipulate.json_create_proc
		(name,population,date_mod);
	rd.Set (id.ToString (), json_new);
}


// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
