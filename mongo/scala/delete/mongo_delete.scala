// --------------------------------------------------------------
//	mongo_delete.scala
//
//					Sep/02/2013
// --------------------------------------------------------------
import com.mongodb.Mongo
import com.mongodb.DB
import com.mongodb.DBCollection
import com.mongodb.BasicDBObject
import com.mongodb.DBObject
import com.mongodb.DBCursor

// --------------------------------------------------------------
object mongo_delete
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val	key_in = args(0)

	println ("\tkey_in = " + key_in)

	val mm = new Mongo ("localhost" ,27017)

	val db = mm.getDB ("city_db")

	val col_name = "saitama";

	val coll = db.getCollection (col_name)

	mongo_manipulate.mongo_delete_proc (coll,key_in)

	mongo_manipulate.mongo_display_proc (coll)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
