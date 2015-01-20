// ------------------------------------------------------------------    
//	redis_create.groovy
//
//					Jan/05/2015
//
// ------------------------------------------------------------------    
import redis.clients.jedis.Jedis

import groovy.json.*
// ------------------------------------------------------------------    
class redis_create
{

// ------------------------------------------------------------------    
static void main(String[] args)  throws Exception
{
	println ("*** 開始 ***")

	Jedis jedis = new Jedis ("host_dbase")            

	create_record_proc (jedis,"t1851","福井",51289,"1999-5-14")
	create_record_proc (jedis,"t1852","敦賀",42617,"1999-2-8")
	create_record_proc (jedis,"t1853","小浜",34182,"1999-8-21")
	create_record_proc (jedis,"t1854","大野",79435,"1999-3-17")
	create_record_proc (jedis,"t1855","勝山",25364,"1999-5-14")
	create_record_proc (jedis,"t1856","鯖江",16537,"1999-10-28")
	create_record_proc (jedis,"t1857","あわら",62931,"1999-7-11")
	create_record_proc (jedis,"t1858","越前",29653,"1999-8-30")
	create_record_proc (jedis,"t1859","坂井",74612,"1999-11-20")


	println ("*** 終了 ***")

}

// ------------------------------------------------------------------    
static create_record_proc (
	Jedis jedis,String key,String name_in,int population_in,String date_mod_in)
{

	def unit_aa = ['name': name_in, 'population': population_in, 'date_mod': date_mod_in]

	def json = new JsonBuilder()

	json (unit_aa)

	def str_json = json.toString ()

	println (str_json)

	jedis.set(key,str_json)
}
// ------------------------------------------------------------------    
}
// ------------------------------------------------------------------    
