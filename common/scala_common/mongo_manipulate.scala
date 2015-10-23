// --------------------------------------------------------------
//	scala_common/mongo_manipulate.scala
//
//					Sep/02/2013
// --------------------------------------------------------------
import com.mongodb.Mongo
import com.mongodb.DB
import com.mongodb.DBCollection
import com.mongodb.BasicDBObject
import com.mongodb.DBObject
import com.mongodb.DBCursor

import  scala.util.parsing.json.JSON
// --------------------------------------------------------------
object mongo_manipulate
{

// --------------------------------------------------------------
def mongo_display_proc (coll:DBCollection)
{
	println ("coll.getCount() = " + coll.getCount())

	val cur = coll.find()

	while(cur.hasNext()) {
		val json_str = cur.next().toString ()

//		println (json_str)

		val aaa = JSON.parse(json_str)

		val note: Option[List[Any]] = aaa

		note.foreach (kkk =>
			{
			var key = ""
			var name = ""
			var population = "" 
			var date_mod = ""
			kkk.foreach (lll =>
				{
				lll match {
					case ("_id",_) => null
					case ("key",value) => key = value.toString
					case ("name",value) => name = value.toString
					case ("population",value) => population = value.toString.toDouble.toInt.toString
					case ("date_mod",value) => date_mod = value.toString
					}
				})

			println (key + "\t" + name + "\t" + population + "\t" + date_mod)
			})

		}

}

// --------------------------------------------------------------
def mongo_update_proc
	(coll:DBCollection,key_in:String,population:Int)
{
	print ("*** mongo_update_proc ***")
	print ("\tkey = " + key_in)
	println ("\tpopulation = " + population)

	val query = new BasicDBObject()
	query.put ("key",key_in)
	val cur = coll.find(query)

	println ("cur.count () = " + cur.count ())
	println (coll.getCount())

	var name_aa = ""

	while(cur.hasNext())
		{
		val obj = cur.next()
		name_aa = obj.get ("name").toString ()
		}


	val doc = new BasicDBObject()
	doc.put("key",key_in)

	doc.put("name",name_aa)

	doc.put("population",population)
	val  str_ddx = text_manipulate.get_current_date_proc ()
	doc.put("date_mod",str_ddx)

	coll.update (query,doc)

}

// --------------------------------------------------------------
def mongo_delete_proc (coll:DBCollection,key_in:String)
{
	print ("*** mongo_delete_proc ***")
	println ("\tkey = " + key_in)

	val query = new BasicDBObject()
	query.put("key", key_in)

	coll.remove (query)
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
