// --------------------------------------------------------------
//	mongo_create.scala
//
//					May/24/2011
// --------------------------------------------------------------
import	java.util.HashMap

import com.mongodb.Mongo
import com.mongodb.DB
import com.mongodb.DBCollection
import com.mongodb.BasicDBObject
import com.mongodb.DBObject
import com.mongodb.DBCursor

// --------------------------------------------------------------
object mongo_create
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val mm = new Mongo ("localhost" ,27017 )

	val db = mm.getDB ("city_db")

	val col_name = "saitama"
	val coll = db.getCollection (col_name)

	coll.drop ()

	mongo_create_proc (coll,"t1161","さいたま",74521,"1998-5-12")
	mongo_create_proc (coll,"t1162","所沢",15853,"1998-12-25")
	mongo_create_proc (coll,"t1163","越谷",56418,"1998-7-9")
	mongo_create_proc (coll,"t1164","久喜",42367,"1998-9-14")
	mongo_create_proc (coll,"t1165","熊谷",23419,"1998-3-17")
	mongo_create_proc (coll,"t1166","秩父",35698,"1998-7-21")
	mongo_create_proc (coll,"t1167","川越",86517,"1998-8-5")
	mongo_create_proc (coll,"t1168","和光",69421,"1998-7-24")
	mongo_create_proc (coll,"t1169","新座",41872,"1998-4-18")

	mongo_manipulate.mongo_display_proc (coll)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
def mongo_create_proc
	(coll:DBCollection,key_in:String,name_in:String,
	population_in:Int,date_mod_in:String)
{
	val doc = new BasicDBObject()

	doc.put("key",key_in)
	doc.put("name",name_in)
	doc.put("population",population_in)
	doc.put("date_mod",date_mod_in)

	coll.insert (doc)
}


// --------------------------------------------------------------
}
// --------------------------------------------------------------
