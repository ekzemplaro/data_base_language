// ------------------------------------------------------------------    
//	redis_create.scala
//
//					Jan/22/2015
//
// ------------------------------------------------------------------    
import redis.clients.jedis.Jedis
import scala.collection.mutable

import org.json4s._
import org.json4s.JsonDSL._
import org.json4s.native.JsonMethods._
// ------------------------------------------------------------------    
object redis_create
{

// ------------------------------------------------------------------    
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val dict_aa = data_prepare_proc ()

	val server = "host_dbase"

	redis_manipulate.dict_to_redis_proc (server,dict_aa)


	println ("*** 終了 ***")        

}

// ------------------------------------------------------------------    
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1851","福井",25173,"1998-9-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1852","敦賀",35719,"1998-5-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1853","小浜",19543,"1998-1-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1854","大野",54312,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1855","勝山",79285,"1998-5-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1856","鯖江",27154,"1998-10-27")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1857","あわら",56892,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1858","越前",31428,"1998-7-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1859","坂井",23875,"1998-10-14")


	dict_aa
}

// ------------------------------------------------------------------    
}
// ------------------------------------------------------------------    
