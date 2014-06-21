// --------------------------------------------------------------
//	update/mongo_update.java
//
//					Sep/02/2013
// --------------------------------------------------------------
import	java.util.HashMap;

import com.mongodb.Mongo;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;

// --------------------------------------------------------------
public class mongo_update
{

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
System.out.println (" *** aaaa ***");
Mongo mm = new Mongo ("localhost" ,27017);

	DB db = mm.getDB ("city_db");

	String col_name = "saitama";

	DBCollection coll = db.getCollection (col_name);
	System.out.println ("\tcoll.getCount ()  = " + coll.getCount ());


	System.out.println(coll.getCount());


	mongo_manipulate.mongo_update_proc (coll,key_in,population);

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
