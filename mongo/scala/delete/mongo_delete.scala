// --------------------------------------------------------------
//	mongo_delete.scala
//
//					Sep/11/2015
// --------------------------------------------------------------
import com.mongodb.MongoClient
import com.mongodb.client.MongoDatabase
import com.mongodb.client.MongoCollection

import org.bson.Document

// --------------------------------------------------------------
object mongo_delete
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val	key_in = args(0)

	println ("\tkey_in = " + key_in)

	val client = new MongoClient ("localhost",27017)

	val db = client.getDatabase ("city_db")

	val col_name = "saitama";

	val coll = db.getCollection (col_name)

	println (coll.count ())

	coll.deleteMany (new Document("key", key_in))

	println (coll.count ())

	client.close ()

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
