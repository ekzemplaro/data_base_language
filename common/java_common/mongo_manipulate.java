// --------------------------------------------------------------
//	java_common/mongo_manipulate.java
//
//					Sep/02/2013
// --------------------------------------------------------------
import	java.util.HashMap;
import	java.util.List;

import com.mongodb.Mongo;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;

// --------------------------------------------------------------
public class mongo_manipulate
{

// --------------------------------------------------------------
public static void mongo_display_proc (DBCollection coll)
{
	System.out.println(coll.getCount());

	DBCursor cur = coll.find();

	while(cur.hasNext())
		{
		DBObject obj = cur.next();

		System.out.print (obj.get ("key") + "\t");
		System.out.print (obj.get ("name") + "\t");
		System.out.print (obj.get ("population") + "\t");
		System.out.println (obj.get ("date_mod"));
		}

}

// --------------------------------------------------------------
public static void mongo_update_proc
	(DBCollection coll,String key_in,int population)
{
	System.out.print ("*** mongo_update_proc ***");
	System.out.print ("\tkey_in = " + key_in);
	System.out.println ("\tpopulation = " + population);

	BasicDBObject query = new BasicDBObject();
	query.put("key",key_in);

	DBCursor cur = coll.find(query);

	System.out.println (cur.count ());

	String name_aa = "";
while(cur.hasNext())
		{
		DBObject obj = cur.next();
		System.out.print (obj.get ("key") + "\t");
                System.out.print (obj.get ("name") + "\n");

		name_aa = obj.get ("name").toString ();
		}

	BasicDBObject doc = new BasicDBObject();

	doc.put("key",key_in);
	doc.put("name",name_aa);

	doc.put("population",population);
	String  str_ddx = text_manipulate.get_current_date_proc ();
	doc.put("date_mod",str_ddx);
	coll.update (query,doc);
}

// --------------------------------------------------------------
public static void mongo_delete_proc (DBCollection coll,String key_in)
{
	System.out.print ("*** mongo_delete_proc ***");
	System.out.println ("\tkey_in = " + key_in);

	BasicDBObject query = new BasicDBObject();
	query.put ("key",key_in);

	coll.remove (query);
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
