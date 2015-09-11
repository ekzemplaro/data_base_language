// --------------------------------------------------------------
//	read/mongo_read.java
//
//					Sep/11/2015
// --------------------------------------------------------------
import com.mongodb.MongoClient;
// import com.mongodb.client.MongoIterator;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.FindIterable;
import com.mongodb.Block;


import org.bson.Document;
// --------------------------------------------------------------
public class mongo_read
{

// --------------------------------------------------------------
public static void mongo_display_proc (MongoCollection coll)
{
	System.out.println(coll.count());

	FindIterable iterable = coll.find();

	iterable.forEach(new Block<Document>()
		{
    @Override
    public void apply(final Document doc) {
	System.out.print (doc.get ("key") + "\t");
	System.out.print (doc.get ("name") + "\t");
	System.out.print (doc.get ("population") + "\t");
	System.out.println (doc.get ("date_mod"));
			}	
		});

/*
	MongoIterator<Document> iter = coll.find ();

	while (iter.hasNext ())
		{
		System.out.println (iter.next ());
		}
*/
}

// --------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	try
	{
	MongoClient client = new MongoClient ("localhost",27017);

	MongoDatabase db = client.getDatabase ("city_db");

	String col_name = "saitama";
 
	MongoCollection coll = db.getCollection (col_name);

//	mongo_manipulate.mongo_display_proc (coll);
	mongo_display_proc (coll);

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
