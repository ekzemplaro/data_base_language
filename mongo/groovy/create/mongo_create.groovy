// --------------------------------------------------------------
//	mongo_create.groovy
//
//					Sep/10/2015
// --------------------------------------------------------------
import	java.util.HashMap

import com.mongodb.MongoClient
import com.mongodb.client.MongoDatabase
import com.mongodb.client.MongoCollection
import com.mongodb.client.FindIterable
import com.mongodb.Block

import org.bson.Document

// --------------------------------------------------------------
class mongo_create
{

// --------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	MongoClient mm = new MongoClient ("localhost",27017)

	MongoDatabase db = mm.getDatabase ("city_db")

	String col_name = "saitama"
 
	MongoCollection coll = db.getCollection (col_name)

	coll.drop ()

	groovy_mongo_create_proc (coll,"t1161","さいたま",42571,"1999-7-8")
	groovy_mongo_create_proc (coll,"t1162","所沢",75286,"1999-10-27")
	groovy_mongo_create_proc (coll,"t1163","越谷",26435,"1999-2-3")
	groovy_mongo_create_proc (coll,"t1164","久喜",32671,"1999-9-14")
	groovy_mongo_create_proc (coll,"t1165","熊谷",41783,"1999-3-17")
	groovy_mongo_create_proc (coll,"t1166","秩父",75294,"1999-7-21")
	groovy_mongo_create_proc (coll,"t1167","川越",93876,"1999-8-9")
	groovy_mongo_create_proc (coll,"t1168","和光",19421,"1999-1-4")
	groovy_mongo_create_proc (coll,"t1169","新座",53879,"1999-2-18")

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
static groovy_mongo_create_proc (MongoCollection coll,String key_in,
	String name_in,int population_in,String date_mod_in)
{
	Document doc = new Document("key",key_in)
		.append ("name",name_in)
		.append ("population",population_in)
		.append ("date_mod",date_mod_in);

	coll.insertOne (doc);
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
