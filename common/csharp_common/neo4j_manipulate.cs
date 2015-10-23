// -------------------------------------------------------------
//
//	neo4j_manipulate.cs
//
//						Oct/21/2011
// -------------------------------------------------------------
using System;
using System.Collections.Generic;

using Newtonsoft.Json;
// -------------------------------------------------------------
public class neo4j_manipulate
{

// -------------------------------------------------------------
public static void out_record_proc (String key,String json_str)
{
	Dictionary<String,Object> city
		= JsonConvert.DeserializeObject
			 <Dictionary<String,Object>> (json_str);

	Console.Write (city["id"] + "\t");
	Console.Write (city["name"] + "\t");
	Console.Write (city["population"] + "\t");
	Console.Write (city["date_mod"] + "\n");
}


// -------------------------------------------------------------
}
// -------------------------------------------------------------
