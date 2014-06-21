// -------------------------------------------------------------------
//
//	mongo_delete.groovy
//
//					Sep/02/2013
//
// -------------------------------------------------------------------
import com.mongodb.Mongo
import com.mongodb.DB
import com.mongodb.DBCollection

import	mongo_manipulate
// -------------------------------------------------------------------
class mongo_delete
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	String key_in = args[0]

	println (key_in)

	Mongo mm = new Mongo ("localhost",27017)

	DB db = mm.getDB ("city_db" )

	String col_name = "saitama"

	DBCollection coll = db.getCollection(col_name)

	mongo_manipulate.mongo_delete_proc (coll,key_in)

	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
