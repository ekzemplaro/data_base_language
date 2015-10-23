// -------------------------------------------------------------------
//
//	mongo_manipulate.groovy
//
//					Sep/02/2013
//
// -------------------------------------------------------------------
import com.mongodb.DB
import com.mongodb.Mongo
import com.mongodb.DBCollection
import com.mongodb.DBCursor
import com.mongodb.BasicDBObject

import	text_manipulate
// -------------------------------------------------------------------
class mongo_manipulate
{
// -------------------------------------------------------------------
static mongo_to_dict_proc (coll)
{
	println coll.getCount()

	DBCursor cursor = coll.find()

	def dict_aa = new HashMap()

	while(cursor.hasNext())
		{
		def data = cursor.next ()

		dict_aa = text_manipulate.dict_append_proc (dict_aa,data.key,data.name,data.population,data.date_mod)
		}

	return	dict_aa
}

// -------------------------------------------------------------------
static mongo_update_proc (coll,key_in,population_in)
{
	println coll.getCount()

	def query = new BasicDBObject();
	query.put("key",key_in);

	def cursor = coll.find(query)

	while(cursor.hasNext())
		{
		def data = cursor.next ()
		println (data.key);

		def doc = new BasicDBObject()
		doc.put("key",key_in)
		doc.put("name",data.name)
		doc.put("population",population_in)
		def str_ddx = new Date ().format ("yyyy-MM-dd")
		doc.put("date_mod",str_ddx)

		coll.update (query,doc)
		}
}
// -------------------------------------------------------------------
static mongo_delete_proc (coll,key_in)
{
	println coll.getCount()

	BasicDBObject query = new BasicDBObject()
	query.put ("key",key_in)
	coll.remove (query)
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
