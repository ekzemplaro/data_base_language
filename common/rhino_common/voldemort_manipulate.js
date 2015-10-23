// --------------------------------------------------------------
//
//	voldemort_manipulate.js
//
//					Jul/30/2011
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
function voldemort_to_dict_proc (client)
{
	var keys[] = ["t3051","t3052","t3053",
			"t3054","t3055","t3056",
			"t3057","t3058","t3059"];


	var dict_aa = new HashMap <String, HashMap<String,String>> ();

	for (var it in keys)
		{
		var key = keys[it];
		var version = client.get (key);

		if (version != null)
			{
			var str_json = version.getValue ();
			var dict_unit = record_parse_proc (key,str_json);
			dict_aa.put (key,dict_unit);
			}
		}

	return	dict_aa;
}

// --------------------------------------------------------------
function record_parse_proc (key,str_json)
{
	var unit_data = (HashMap <String,String>)JSON.decode (str_json);


	return	unit_data;
}

// --------------------------------------------------------------
function dict_to_voldemort_proc (dict_aa,client)
{
	for (var key in dict_aa)
		{

		var dict_unit = dict_aa.get (key);

		var name_in = (String)dict_unit.get ("name");

		var population_in = Integer.parseInt (dict_unit.get ("population"));
		var date_mod_in = dict_unit.get ("date_mod");
	
	var str_json  = mcached_manipulate.json_create_proc (name_in,population_in,date_mod_in);

		client.put (key,str_json);
		}

}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
