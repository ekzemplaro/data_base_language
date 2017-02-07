// ------------------------------------------------------------------    
//	redis_update.groovy
//
//					Apr/11/2013
//
// ------------------------------------------------------------------    
import	redis.clients.jedis.Jedis

import groovy.json.*
// ------------------------------------------------------------------    
class redis_update
{

// ------------------------------------------------------------------    
static void main(String[] args)  throws Exception
{
	println ("*** 開始 ***")

       	def	key = args[0]
	def	population = Integer.parseInt (args[1])
	print ("\tkey = " + key)
	println ("\tpopulation = " + population) 

	Jedis jedis = new Jedis ("host_dbase")            

	if (jedis.exists (key))
		{           
		def str_json = jedis.get(key)

		def json_new = create_new_json_proc (str_json,population)

		jedis.set(key,json_new)
		}

	println ("*** 終了 ***")
}

// ------------------------------------------------------------------    
static String create_new_json_proc (String str_json,int population_in)
{
	def slurper = new JsonSlurper()
	def oox = slurper.parseText (str_json)

	print (oox.name + "\t")
	print (oox.population + "\t")
	println (oox.date_mod)

	def today = new Date ().format ("yyyy-MM-dd")

	oox.population =  population_in
	oox.date_mod = today

	def json = new JsonBuilder()

	json (oox)

	def json_new = json.toString ()

	return	json_new
}
// ------------------------------------------------------------------    
}
// ------------------------------------------------------------------    
