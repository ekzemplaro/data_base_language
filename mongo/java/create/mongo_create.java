// --------------------------------------------------------------
//	mongo_create.java
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
public class mongo_create
{

// --------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	try
	{
	Mongo mm = new Mongo ("localhost" ,27017 );

	DB db = mm.getDB ("city_db");

	String col_name = "saitama";

	DBCollection coll = db.getCollection (col_name);

	coll.drop ();

	mongo_create_proc (coll,"t1161","さいたま",34591,"2008-9-12");
	mongo_create_proc (coll,"t1162","所沢",25187,"2008-3-21");
	mongo_create_proc (coll,"t1163","越谷",76421,"2008-7-8");
	mongo_create_proc (coll,"t1164","久喜",32895,"2008-9-14");
	mongo_create_proc (coll,"t1165","熊谷",43756,"2008-3-17");
	mongo_create_proc (coll,"t1166","秩父",75347,"2008-7-21");
	mongo_create_proc (coll,"t1167","川越",96284,"2008-8-9");
	mongo_create_proc (coll,"t1168","和光",19421,"2008-1-4");
	mongo_create_proc (coll,"t1169","新座",81752,"2008-2-8");

	mongo_manipulate.mongo_display_proc (coll);
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
public static void mongo_create_proc
	(DBCollection coll,String key_in,String name_in,
	int population_in,String date_mod_in)
{
	BasicDBObject doc = new BasicDBObject();

	doc.put("key",key_in);
	doc.put("name",name_in);
	doc.put("population",population_in);
	doc.put("date_mod",date_mod_in);

	coll.insert (doc);
}


// --------------------------------------------------------------
}
// --------------------------------------------------------------
