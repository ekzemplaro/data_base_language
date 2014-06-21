// --------------------------------------------------------------
//	read/mongo_read.java
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
public class mongo_read
{

// --------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	try
	{
	Mongo mm = new Mongo ("localhost" ,27017 );

	DB db = mm.getDB ("city_db" );

	String col_name = "saitama";
//	String col_name = "cities";
 
	DBCollection coll = db.getCollection (col_name);

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
