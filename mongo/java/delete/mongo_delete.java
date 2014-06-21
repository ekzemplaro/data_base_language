// --------------------------------------------------------------
//	mongo_delete.java
//
//					Sep/02/2013
// --------------------------------------------------------------
import com.mongodb.Mongo;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;

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
	Mongo mm = new Mongo ("localhost" ,27017);

	DB db = mm.getDB ("city_db");

	String col_name = "saitama";

	DBCollection coll = db.getCollection (col_name);
	System.out.println ("\tcoll.getCount ()  = " + coll.getCount ());

	mongo_manipulate.mongo_delete_proc (coll,key_in);

	mongo_manipulate.mongo_display_proc (coll);
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
