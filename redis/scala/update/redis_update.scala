// ------------------------------------------------------------------    
//	redis_update.scala
//
//					Jan/22/2015
//
// ------------------------------------------------------------------    
import	redis.clients.jedis.Jedis
import	scala.collection.mutable

// ------------------------------------------------------------------    
object redis_update
{
// ------------------------------------------------------------------    
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val key = args(0)
	val population_in = args(1).toInt

	println ("\tkey = " + key)
	println (population_in)

	var jedis = new Jedis ("host_dbase")            

	redis_manipulate.redis_update_proc (jedis,key,population_in)

	println ("*** 終了 ***")        
}

// ------------------------------------------------------------------    
}
// ------------------------------------------------------------------    
