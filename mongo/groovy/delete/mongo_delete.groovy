// -------------------------------------------------------------------
//
//	mongo_delete.groovy
//
//					Sep/10/2015
//
// -------------------------------------------------------------------
import com.mongodb.MongoClient
import com.mongodb.client.MongoDatabase
import com.mongodb.client.MongoCollection

import org.bson.Document
// -------------------------------------------------------------------
class mongo_delete
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	String key_in = args[0]

	println (key_in)

	MongoClient mm = new MongoClient ("localhost" ,27017)

	MongoDatabase db = mm.getDatabase ("city_db")

	String col_name = "saitama"

	MongoCollection coll = db.getCollection (col_name)
	println ("\tcoll.count ()  = " + coll.count ())

	coll.deleteMany (new Document("key", key_in))

	println ("\tcoll.count ()  = " + coll.count ())

	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
