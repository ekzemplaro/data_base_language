// ------------------------------------------------------------------    
//	redis_read.groovy
//
//					Apr/11/2013
//
// ------------------------------------------------------------------    
import redis.clients.jedis.Jedis

import groovy.json.*

// ------------------------------------------------------------------    
class redis_read
{

// ------------------------------------------------------------------    
static void main(String[] args)
{
	println ("*** 開始 ***")
        
	try {
		Jedis jedis = new Jedis("host_dbase")

		def keys = jedis.keys("*")
            
		for (key in keys)
			{
			def str_json = jedis.get(key)

			if (str_json != null)
				{
				def slurper = new JsonSlurper()
				def oox = slurper.parseText (str_json)

				print (key + "\t")
				print (oox.name + "\t")
				print (oox.population + "\t")
				println (oox.date_mod)
				}
			}

	} catch (Exception ee){
		ee.printStackTrace()
	}

	println ("*** 終了 ***")        

}
// ------------------------------------------------------------------    
}
// ------------------------------------------------------------------    
