// --------------------------------------------------------------
//
//	voldemort_manipulate.scala
//
//					Jan/27/2012
//
// --------------------------------------------------------------
import scala.collection.mutable

import voldemort.client.ClientConfig
import voldemort.client.SocketStoreClientFactory
import voldemort.client.StoreClient
import voldemort.client.StoreClientFactory
import voldemort.versioning.Versioned

import scala.util.parsing.json.JSON

import	java.util.HashMap
import	java.util.Set
// --------------------------------------------------------------
object voldemort_manipulate
{
// --------------------------------------------------------------
def voldemort_to_dict_proc (client:StoreClient[String,String])
	:(mutable.Map[String,Object]) = {
	val keys = Array ("t3051","t3052","t3053",
			"t3054","t3055","t3056",
			"t3057","t3058","t3059")

	val dict_aa = mutable.Map[String,Object] ()

	for (key <- keys)
		{
		val version = client.get (key)

		if (version != null)
			{
			val str_json = version.getValue ()
			val dict_unit = json_manipulate.json_to_unit_proc (str_json)
			dict_aa.put (key,dict_unit)
			}
		}

	return	dict_aa
}

// --------------------------------------------------------------
def dict_to_voldemort_proc (dict_aa:mutable.Map[String,Object],
	 client:StoreClient[String,String])
{
//	val set_aaa = dict_aa.keySet ()

//	for (key_aa <- set_aaa)
	for (pair <- dict_aa)
		{
		val key_aa = pair._1
		val dict_unit = pair._2.asInstanceOf [mutable.Map[String,String]]


		val name_in = dict_unit ("name")

		val population_in = Integer.parseInt (dict_unit("population"))
		val date_mod_in = dict_unit ("date_mod")
	
	val str_json  = json_manipulate.unit_json_gen_proc (name_in,population_in,date_mod_in)

		client.put (key_aa,str_json)
		}

}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
