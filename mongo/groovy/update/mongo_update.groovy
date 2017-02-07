// -------------------------------------------------------------------
//
//	mongo_update.groovy
//
//					Sep/10/2015
//
// -------------------------------------------------------------------
import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.FindIterable;
import com.mongodb.Block;

import com.mongodb.BasicDBObject;

import org.bson.Document;

// import	text_manipulate
//import	mongo_manipulate
// -------------------------------------------------------------------
class mongo_update
{
// -------------------------------------------------------------------
public static void mongo_update_proc (MongoCollection coll,String key_in,int population)
{
	println ("*** mongo_update_proc *** aaa ***")
	String  today =  new Date ().format ("yyyy-MM-dd")

	BasicDBObject query = new BasicDBObject("key", key_in);
	FindIterable iterable = coll.find(query);

	println ("*** mongo_update_proc *** ccc ***")
	iterable.forEach(new Block <Document> ()
		{
		@Override
		public void apply(final Document doc) {
		final String name_aa = doc.get ("name").toString ();

		Document doc_aa = new Document("key",key_in)
		.append ("name",name_aa)
		.append ("population",population)
		.append ("date_mod",today);

		coll.replaceOne (new Document("key", key_in),doc_aa);
			}
		});
}

// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	String key_in = args[0]
	int population_in = Integer.parseInt (args[1])

	println (key_in + "\t" +  population_in)

	MongoClient mm = new MongoClient ("localhost" ,27017)

	MongoDatabase db = mm.getDatabase ("city_db")

	String col_name = "saitama"

	MongoCollection coll = db.getCollection (col_name)


//	mongo_manipulate.mongo_update_proc (coll,key_in,population_in)
	mongo_update_proc (coll,key_in,population_in)

	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
