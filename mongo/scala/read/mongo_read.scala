// --------------------------------------------------------------
//	read/mongo_read.scala
//
//					Sep/10/2015
// --------------------------------------------------------------
import com.mongodb.MongoClient
import com.mongodb.client.MongoDatabase
import com.mongodb.client.MongoCollection
import com.mongodb.client.FindIterable
import com.mongodb.Block

import org.bson.Document
// --------------------------------------------------------------
object mongo_read
{

// --------------------------------------------------------------
def mongo_display_proc (coll:MongoCollection[Document])
{
	val dict_aa = new HashMap()
	println (coll.count())

	FindIterable iterable = coll.find();

	iterable.forEach(new Block<Document>()
		{
		@Override
	apply(final Document doc) {
		def key = doc.get ("key")
		def name = doc.get ("name")
		def population = doc.get ("population")
		def date_mod = doc.get ("date_mod")
		dict_aa = text_manipulate.dict_append_proc (dict_aa,key,name,population,date_mod)
			}	
		});

	return	dict_aa
}

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val mm = new MongoClient ("localhost" ,27017 )

	val db = mm.getDatabase ("city_db" )

	val col_name = "saitama"
 
	val coll = db.getCollection (col_name)

//	mongo_manipulate.mongo_display_proc (coll)
	mongo_display_proc (coll)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
