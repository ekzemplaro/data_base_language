// -------------------------------------------------------------
//
//	kvalue_manipulate.cs
//
//						Jul/24/2014
// -------------------------------------------------------------
using System;
using System.Collections.Generic;

using Newtonsoft.Json;
// -------------------------------------------------------------
public class kvalue_manipulate
{

// -------------------------------------------------------------
public static void out_record_proc (String key,String json_str)
{
	Dictionary<String,Object> city
		= JsonConvert.DeserializeObject
			 <Dictionary<String,Object>> (json_str);

	Console.Write (key + "\t");
	Console.Write (city["name"] + "\t");
	Console.Write (city["population"] + "\t");
	Console.Write (city["date_mod"] + "\n");
}

// -------------------------------------------------------------
public static String json_update_proc
	(String key,int population_in,String json_str)
{
	Dictionary<String,Object> city
		= JsonConvert.DeserializeObject
			 <Dictionary<String,Object>> (json_str);

/*
	Console.Write (key + "\t");
	Console.Write (city["name"] + "\t");
	Console.Write (city["population"] + "\t");
	Console.Write (city["date_mod"] + "\n");
*/
	city["population"] = population_in;

	city["date_mod"] = DateTime.Now.ToString ();

	String json_new = JsonConvert.SerializeObject (city);

//	Console.WriteLine (json_new);

	return	json_new;
}

// -------------------------------------------------------------
public static String json_create_proc
	(String name,int population,String date_mod)
{
	Dictionary<String,Object> city = new Dictionary<String,Object>();

	city["name"] = name;
	city["population"] = population;
	city["date_mod"] = date_mod;

	Console.Write (city["name"] + "\t");
	Console.Write (city["population"] + "\t");
	Console.Write (city["date_mod"] + "\n");

	String json_new = JsonConvert.SerializeObject (city);

//	Console.WriteLine (json_new);

	return	json_new;
}

// -------------------------------------------------------------
}
// -------------------------------------------------------------
