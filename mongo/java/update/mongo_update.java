// --------------------------------------------------------------
//	update/mongo_update.java
//
//					Sep/11/2015
// --------------------------------------------------------------
import	java.util.HashMap;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.FindIterable;
import com.mongodb.Block;

import com.mongodb.BasicDBObject;

import org.bson.Document;

// --------------------------------------------------------------
public class mongo_update
{
// --------------------------------------------------------------
public static void mongo_update_proc
	(MongoCollection coll,String key_in,int population)
{
	String  today = text_manipulate.get_current_date_proc ();

	BasicDBObject query = new BasicDBObject("key", key_in);
	FindIterable iterable = coll.find(query);

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

// --------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	String	key_in = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tkey_in = " + key_in);
	System.out.println ("\tpopulation = " + population);

	try
	{
	MongoClient client = new MongoClient ("localhost",27017);

	MongoDatabase db = client.getDatabase ("city_db");

	String col_name = "saitama";

	MongoCollection coll = db.getCollection (col_name);
	System.out.println ("\tcoll.count ()  = " + coll.count ());

	mongo_update_proc (coll,key_in,population);

	client.close ();
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
