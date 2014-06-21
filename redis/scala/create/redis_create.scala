// ------------------------------------------------------------------    
//	redis_create.scala
//
//					Jun/10/2013
//
// ------------------------------------------------------------------    
import redis.clients.jedis.Jedis

// ------------------------------------------------------------------    
object redis_create
{

// ------------------------------------------------------------------    
def main (args: Array[String])
{
	println ("*** 開始 ***")


	var jedis = new Jedis ("host_dbase")            

	redis_data_set_proc (jedis,"t1851","福井",56783,"1998-7-20");
	redis_data_set_proc (jedis,"t1852","敦賀",25467,"1998-5-24");
	redis_data_set_proc (jedis,"t1853","小浜",85321,"1998-4-18");
	redis_data_set_proc (jedis,"t1854","大野",45213,"1998-2-8");
	redis_data_set_proc (jedis,"t1855","勝山",35748,"1998-9-9");
	redis_data_set_proc (jedis,"t1856","鯖江",95631,"1998-5-11");
	redis_data_set_proc (jedis,"t1857","あわら",25782,"1998-8-30");
	redis_data_set_proc (jedis,"t1858","越前",82591,"1998-10-18");
	redis_data_set_proc (jedis,"t1859","坂井",93156,"1998-12-12");


	println ("*** 終了 ***")        

}

// ------------------------------------------------------------------    
def redis_data_set_proc (jedis:Jedis,id:String,name_in:String,population_in:Int,date_mod:String) =
{
	var json_new = "{\"name\": \"" + name_in + "\"," +
	"\"population\": " + population_in.toString + "," +
	"\"date_mod\": \"" + date_mod + "\"}"

	jedis.set (id.toString,json_new)
}

// ------------------------------------------------------------------    
}
// ------------------------------------------------------------------    
