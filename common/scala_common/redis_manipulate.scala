// ------------------------------------------------------------------    
//	redis_manipulate.scala
//
//					Apr/11/2013
//
// ------------------------------------------------------------------    
import	java.io.PrintWriter
import	java.util.HashMap

import	redis.clients.jedis.Jedis

import scala.util.parsing.json.JSON
// ------------------------------------------------------------------    
object redis_manipulate
{


// ------------------------------------------------------------------    
def record_parse_proc (key:String, str_json:String)
{
	var unit_aa = JSON.parse (str_json)

	print (key + "\t")

	for (tpl <- JSON.parse(str_json).get) {
		tpl match {
		case (t1:String, t2:String) if(t1 == "name") => print(t2 + "\t")
		case (t1:String, t2:Double) if(t1 == "population") => print(t2 + "\t")
		case (t1:String, t2:Int) if(t1 == "population") => print(t2 + "\t")
		case (t1:String, t2:String) if(t1 == "population") => print(t2 + "\t")
		case (t1:String, t2:String) if(t1 == "date_mod") => println(t2)
		case _ =>
		}
	}
}

// ------------------------------------------------------------------    
def redis_to_json_proc (jedis:Jedis,keys:Array [String],out:PrintWriter) {
	var	icount = 0
	println ("** check ***")
/*
	sql_to_json.json_header_out_proc  (out)

	for (String key : keys)
		{
		String str_json  = DefaultCodec.toStr (jredis.get (key))

		if (str_json != null)
			{
		String json_new = "\"" + key + "\": {" + str_json.substring (1)
			if (0 < icount)
				{
				out.println (",")
				}

			out.println (json_new)

			icount++
			}
		}

	sql_to_json.json_tail_out_proc  (out)

*/
}

// ------------------------------------------------------------------    
def redis_update_proc (jedis:Jedis,key:String,population_in:Int)
{
	if (jedis.exists(key))
		{
		val str_json = jedis.get(key)
	println ("** check ***")

		val json_new = create_new_json_proc (str_json,population_in)

		jedis.set (key,json_new)
}

}

// ------------------------------------------------------------------    
def create_new_json_proc (str_json:String,population_in:Int) :String =
{
	var	json_new = "";

	var	today = text_manipulate.get_current_date_proc ()
	val	unit_aa = json_manipulate.json_to_unit_proc (str_json)

	json_new = "{\"name\": \"" + unit_aa("name") + "\"," +
	"\"population\": " + population_in + "," +
	"\"date_mod\": \"" + today + "\"}"

	return	json_new
}

// ------------------------------------------------------------------    
}
// ------------------------------------------------------------------    
