// -------------------------------------------------------------------
//
//	mongo_read.groovy
//
//					Sep/02/2013
//
// -------------------------------------------------------------------
import com.mongodb.DB
import com.mongodb.Mongo
import com.mongodb.DBCollection

import	text_manipulate
import	mongo_manipulate
// -------------------------------------------------------------------
class mongo_read
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	Mongo mm = new Mongo ("localhost",27017)
	DB db = mm.getDB ("city_db" )

	String col_name = "saitama"

	DBCollection coll = db.getCollection(col_name)

	def dict_aa = mongo_manipulate.mongo_to_dict_proc (coll)

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
