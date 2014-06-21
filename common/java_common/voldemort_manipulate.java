// --------------------------------------------------------------
//
//	voldemort_manipulate.java
//
//					Sep/09/2011
//
// --------------------------------------------------------------
import voldemort.client.ClientConfig;
import voldemort.client.SocketStoreClientFactory;
import voldemort.client.StoreClient;
import voldemort.client.StoreClientFactory;
import voldemort.versioning.Versioned;

import	net.arnx.jsonic.JSON;

import	java.util.HashMap;
import	java.util.Set;
// --------------------------------------------------------------
public class voldemort_manipulate
{
// --------------------------------------------------------------
static HashMap <String, HashMap<String,String>> voldemort_to_dict_proc
	(StoreClient<String, String> client)
{
	String keys[] = {"t3051","t3052","t3053",
			"t3054","t3055","t3056",
			"t3057","t3058","t3059"};


	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	for (String key: keys)
		{
		Versioned<String> version = client.get (key);

		if (version != null)
			{
			String str_json = version.getValue ();
			HashMap <String,String> dict_unit
				= record_parse_proc (key,str_json);
			dict_aa.put (key,dict_unit);
			}
		}

	return	dict_aa;
}

// --------------------------------------------------------------
static HashMap <String,String> record_parse_proc (String key,String str_json)
{
	HashMap <String,String>  unit_data = new HashMap <String,String> ();

	try
	{
	unit_data = (HashMap <String,String>)JSON.decode (str_json);

/*
	String name = map_data.get ("name");
	Object ppx = map_data.get ("population");
	String date_mod = map_data.get ("date_mod");

	System.out.print (key + "\t");
	System.out.print (name + "\t");
	System.out.print (ppx + "\t");
	System.out.println (date_mod);
*/
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	return	unit_data;
}

// --------------------------------------------------------------
static void dict_to_voldemort_proc
	(HashMap <String, HashMap <String,String>> dict_aa,
	StoreClient<String, String> client)
{
	Set set_aaa = dict_aa.keySet ();

	for (Object key_aa: set_aaa)
		{
		HashMap <String,String> dict_unit
				= new HashMap <String,String> ();

		dict_unit = dict_aa.get (key_aa);

		String name_in = (String)dict_unit.get ("name");

		int population_in = Integer.parseInt (dict_unit.get ("population"));
		String date_mod_in = dict_unit.get ("date_mod");
	
	String str_json  = json_manipulate.unit_json_gen_proc (name_in,population_in,date_mod_in);

		String key = (String)key_aa;
		client.put (key,str_json);
		}

}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
