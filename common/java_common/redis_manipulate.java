// ------------------------------------------------------------------    
//	redis_manipulate.java
//
//					Jan/13/2020
//
// ------------------------------------------------------------------    
import	java.io.PrintWriter;
import	java.util.HashMap;
import	java.util.Set;

import	redis.clients.jedis.Jedis;

// import	net.arnx.jsonic.JSON;
// ------------------------------------------------------------------    
public class redis_manipulate
{


// ------------------------------------------------------------------    
static void record_parse_proc (String key, String str_json)
{
//	System.out.println (key + "\t" + str_json);
	System.out.print (key + "\t");


	HashMap<String,String>  map_data = json_manipulate.unit_json_parser (str_json);

	String name = map_data.get ("name").toString ();
	String population = map_data.get ("population").toString ();
	String date_mod = map_data.get ("date_mod").toString ();
	System.out.print (name + "\t");
	System.out.print (population + "\t");
	System.out.println (date_mod);
}

// ------------------------------------------------------------------    
static String redis_to_json_proc (Jedis jedis) throws Exception
{
	Set set_keys = jedis.keys("*");

	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	for (Object obj : set_keys)
		{
		String key = obj.toString ();
		String str_json  = jedis.get(key);

		if (str_json != null)
			{
			HashMap<String,String> unit_aa = json_manipulate.unit_json_parser (str_json);
			dict_aa.put (key,unit_aa);
			}
		}

	String json_str = json_manipulate.dict_to_json_proc (dict_aa);

	return	json_str;
}

// ------------------------------------------------------------------    
static void redis_update_proc
	(Jedis jedis,String key,int population_in) throws Exception
{
	String str_json = jedis.get(key);

	if (str_json != null)
		{
		HashMap<String,String>  unit_aa = json_manipulate.unit_json_parser (str_json);

		System.out.println (unit_aa.get ("name"));        
		String str_population = Integer.toString (population_in);
		String today = text_manipulate.get_current_date_proc ();

		unit_aa.put ("population",str_population);
		unit_aa.put ("date_mod",today);

		String json_new = json_manipulate.unit_json_gen_proc(unit_aa);

		jedis.set (key,json_new);
		}
}

// ------------------------------------------------------------------    
static String create_new_json_proc (String str_json,int population)
{
	HashMap<String,String>  unit_aa = json_manipulate.unit_json_parser (str_json);
        String name = unit_aa.get ("name").toString ();
        String date_mod = text_manipulate.get_current_date_proc ();

	String json_new = json_manipulate.unit_json_gen_proc
		 (unit_aa);

	System.out.println (date_mod);        

	return	json_new;
}

// --------------------------------------------------------------
}
// ------------------------------------------------------------------    
