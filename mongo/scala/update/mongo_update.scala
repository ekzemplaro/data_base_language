// --------------------------------------------------------------
//	update/mongo_update.scala
//
//					Sep/02/2013
// --------------------------------------------------------------

import com.mongodb.Mongo
import com.mongodb.DB
import com.mongodb.DBCollection
import com.mongodb.BasicDBObject
import com.mongodb.DBObject
import com.mongodb.DBCursor

import  scala.util.parsing.json.JSON

// --------------------------------------------------------------
object mongo_update
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val	key_in = args(0)
	val	population_in = args(1).toInt

	print ("\tkey_in = " + key_in)
	println ("\tpopulation_in = " + population_in)

	val mm = new Mongo ("localhost" ,27017)

	val db = mm.getDB ("city_db")

	val col_name = "saitama"

	val coll = db.getCollection (col_name)

	mongo_manipulate.mongo_update_proc (coll,key_in,population_in)

	mongo_manipulate.mongo_display_proc (coll)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
