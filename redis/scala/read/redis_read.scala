// ------------------------------------------------------------------    
//	redis_read.scala
//
//					Apr/11/2013
//
// ------------------------------------------------------------------    
import redis.clients.jedis.Jedis

// ------------------------------------------------------------------    
object redis_read
{

// ------------------------------------------------------------------    
def main (args: Array[String])
{
	println ("*** 開始 ***")

	var jedis = new Jedis("host_dbase")

	val set_keys = jedis.keys("*")

	val keys = set_keys.toArray ()
	for (key <- keys)
		{
		val str_key = key.toString ()
		val str_json = jedis.get (str_key)

		if (str_json != null)
			{
			redis_manipulate.record_parse_proc (str_key,str_json)
			}
		}

	println ("*** 終了 ***")        

}
// ------------------------------------------------------------------    
}
// ------------------------------------------------------------------    
