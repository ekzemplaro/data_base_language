// ------------------------------------------------------------------    
//	redis_manipulate.scala
//
//					Jan/22/2015
//
// ------------------------------------------------------------------    
import	java.io.PrintWriter
import	java.util.HashMap
import	scala.collection.mutable

import	redis.clients.jedis.Jedis

import org.json4s._
import org.json4s.JsonDSL._
import org.json4s.native.JsonMethods._
// ------------------------------------------------------------------    
object redis_manipulate
{

// ------------------------------------------------------------------    
def redis_to_dict_proc (server:String):(mutable.Map[String,Object]) = {
	var dict_aa = mutable.Map[String,Object] ()

	var jedis = new Jedis(server)

	val set_keys = jedis.keys("*")

	val keys = set_keys.toArray ()

	for (key <- keys)
		{
		val str_key = key.toString ()
		val str_json = jedis.get (str_key)

		if (str_json != null)
			{
//			println (str_json)
			val json = parse (str_json)
			val name = (json \ "name").values
			val population = (json \ "population").values
			val date_mod = (json \ "date_mod").values
			var unit_aa = mutable.Map[String,String] ()
			unit_aa("name") = name.toString
			unit_aa("population") = population.toString
			unit_aa("date_mod") = date_mod.toString
			dict_aa(str_key) = unit_aa
			}
		}
	dict_aa
}

// ------------------------------------------------------------------    
def redis_update_proc (jedis:Jedis,key:String,population_in:Int)
{
	if (jedis.exists(key))
		{
		val str_json = jedis.get(key)
		val	today = text_manipulate.get_current_date_proc ()

		println (str_json)

		val json = parse (str_json)
		val name = (json \ "name").values
		val population = (json \ "population").values
		val date_mod = (json \ "date_mod").values

		var unit_aa = mutable.Map[String,String] ()

		unit_aa("name") = name.toString
		unit_aa("population") = population_in.toString
		unit_aa("date_mod") = today.toString

		val unit_bb = unit_aa.toMap
		val json_str_new = compact(render(unit_bb))

		println (json_str_new);

		jedis.set (key,json_str_new)
	}
}
// ------------------------------------------------------------------    
def dict_to_redis_proc (server:String,dict_aa:mutable.Map[String,Object]){
	var jedis = new Jedis (server)

	for (pair <- dict_aa)
		{
		val key = pair._1
		val unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]

		val unit_bb = unit_aa.toMap
		val json_str = compact(render(unit_bb))

		println (key)
		println (json_str)

		jedis.set (key,json_str)
		}            
}
// ------------------------------------------------------------------    
}
// ------------------------------------------------------------------    
