// -------------------------------------------------------------------
//
//	mongo_read.groovy
//
//					Sep/10/2015
//
// -------------------------------------------------------------------
import com.mongodb.MongoClient
import com.mongodb.client.MongoDatabase
import com.mongodb.client.MongoCollection
import com.mongodb.client.FindIterable
import com.mongodb.Block

import org.bson.Document


import	text_manipulate
// import	mongo_manipulate
// -------------------------------------------------------------------
class mongo_read
{
// -------------------------------------------------------------------
static mongo_to_dict_proc (coll)
{
	def dict_aa = new HashMap()
	println coll.count()

	FindIterable iterable = coll.find();

	iterable.forEach(new Block<Document>()
		{
		@Override
	public void apply(final Document doc) {
		def key = doc.get ("key")
		def name = doc.get ("name")
		def population = doc.get ("population")
		def date_mod = doc.get ("date_mod")
		dict_aa = text_manipulate.dict_append_proc (dict_aa,key,name,population,date_mod)
			}	
		});

	return	dict_aa
}

// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

try
	{
	MongoClient mm = new MongoClient( "localhost" , 27017 )

	MongoDatabase db = mm.getDatabase ("city_db" )

	String col_name = "saitama"
 
	MongoCollection coll = db.getCollection (col_name)


//	def dict_aa = mongo_manipulate.mongo_to_dict_proc (coll)
	def dict_aa = mongo_to_dict_proc (coll)

	text_manipulate.dict_display_proc (dict_aa)
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	println ("*** 終了 ***")
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
