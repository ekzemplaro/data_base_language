// ----------------------------------------------------------------
//	mcache_manipulate.cs
//
//
//					Jul/01/2014
//
// ----------------------------------------------------------------
using System;
using System.Collections;
using System.Collections.Generic;

using Memcached.ClientLibrary;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class mcache_manipulate
{

// ------------------------------------------------------------------
public static Dictionary <string,Object> mcache_to_dict_proc
	(MemcachedClient mc,List <String> keys)
{
	Dictionary <String,Object>  dict_aa = new Dictionary <String,Object> ();
	foreach (String key in keys)
		{
		if (mc.KeyExists (key))
			{
			String json_str = (string)mc.Get(key);

			if (json_str != null)
				{
				Dictionary <String,Object> unit_aa
				= JsonConvert.DeserializeObject
					<Dictionary<String,Object>> (json_str);

		String name = unit_aa["name"].ToString ();
		int population = int.Parse (unit_aa["population"].ToString ());
		String date_mod = unit_aa["date_mod"].ToString ();

		dict_aa = text_manipulate.dict_append_proc
			 (dict_aa,key,name,population,date_mod);
				}
			}
		}

	return	dict_aa;
}

// ------------------------------------------------------------------
public static void data_put_proc (MemcachedClient mc,
	String key,String name_in,int population_in,String date_mod_in)
{
	String value  = kvalue_manipulate.json_create_proc
		(name_in,population_in,date_mod_in);

	if(mc.Set(key, value))
		{
		Console.WriteLine  ("set ok");
		}
	else
		{
		Console.WriteLine ("set ng");
		}
}

// ----------------------------------------------------------------
public static void update_proc (MemcachedClient mc,String key,int population_in)
{
	String json_str = (String)mc.Get (key);

	String json_new = kvalue_manipulate.json_update_proc
			(key,population_in,json_str);

	mc.Set (key, json_new);
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
