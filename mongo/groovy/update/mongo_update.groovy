// -------------------------------------------------------------------
//
//	mongo_update.groovy
//
//					Sep/02/2013
//
// -------------------------------------------------------------------
import com.mongodb.Mongo
import com.mongodb.DB
import com.mongodb.DBCollection


import	mongo_manipulate
// -------------------------------------------------------------------
class mongo_update
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	String key_in = args[0]
	int population_in = Integer.parseInt (args[1])

	println (key_in + "\t" +  population_in)

	def mm = new Mongo ("localhost",27017)
	def db = mm.getDB ("city_db" )

	String col_name = "saitama"

	def coll = db.getCollection(col_name)

	mongo_manipulate.mongo_update_proc (coll,key_in,population_in)

	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
