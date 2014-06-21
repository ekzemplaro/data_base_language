// --------------------------------------------------------------
//	mongo_create.groovy
//
//					Sep/02/2013
// --------------------------------------------------------------
import	java.util.HashMap

import com.mongodb.Mongo
import com.mongodb.DB
import com.mongodb.DBCollection
import com.mongodb.BasicDBObject
import com.mongodb.DBObject
import com.mongodb.DBCursor

// --------------------------------------------------------------
class mongo_create
{

// --------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	Mongo mm = new Mongo ("localhost" ,27017)

	DB db = mm.getDB ("city_db")

	String col_name = "saitama"

	DBCollection coll = db.getCollection (col_name)

	coll.drop ()

	groovy_mongo_create_proc (coll,"t1161","さいたま",49571,"1999-3-14")
	groovy_mongo_create_proc (coll,"t1162","所沢",75286,"1999-10-27")
	groovy_mongo_create_proc (coll,"t1163","越谷",26435,"1999-2-3")
	groovy_mongo_create_proc (coll,"t1164","久喜",32641,"1999-9-14")
	groovy_mongo_create_proc (coll,"t1165","熊谷",41783,"1999-3-17")
	groovy_mongo_create_proc (coll,"t1166","秩父",75294,"1999-7-21")
	groovy_mongo_create_proc (coll,"t1167","川越",93876,"1999-8-9")
	groovy_mongo_create_proc (coll,"t1168","和光",19421,"1999-1-4")
	groovy_mongo_create_proc (coll,"t1169","新座",53479,"1999-2-18")

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
static groovy_mongo_create_proc (DBCollection coll,String key_in,String name_in,
	int population_in,String date_mod_in)
{
	BasicDBObject doc = new BasicDBObject()

	doc.put("key",key_in)
	doc.put("name",name_in)
	doc.put("population",population_in)
	doc.put("date_mod",date_mod_in)

	coll.insert (doc)
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
