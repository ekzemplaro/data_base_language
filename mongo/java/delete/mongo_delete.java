// --------------------------------------------------------------
//	mongo_delete.java
//
//					Sep/11/2015
// --------------------------------------------------------------
import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;

import org.bson.Document;
// --------------------------------------------------------------
public class mongo_delete
{

// --------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	String	key_in = args[0];
	System.out.println ("\tkey_in = " + key_in);

	try
	{
	MongoClient client = new MongoClient ("localhost",27017);

	MongoDatabase db = client.getDatabase ("city_db");

	String col_name = "saitama";

	MongoCollection coll = db.getCollection (col_name);
	System.out.println ("\tcoll.count ()  = " + coll.count ());

	coll.deleteMany (new Document("key", key_in));

	System.out.println ("\tcoll.count ()  = " + coll.count ());

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
