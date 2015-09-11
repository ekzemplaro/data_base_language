// --------------------------------------------------------------
//	mongo_create.scala
//
//					Sep/11/2015
// --------------------------------------------------------------
import scala.collection.mutable
import	java.util.HashMap

import com.mongodb.MongoClient
import com.mongodb.client.MongoDatabase
import com.mongodb.client.MongoCollection

import org.bson.Document

// --------------------------------------------------------------
object mongo_create
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val dict_aa = data_prepare_proc ()

	val client = new MongoClient ("localhost",27017)

	val db = client.getDatabase ("city_db")

	val col_name = "saitama"
	val coll = db.getCollection (col_name)

	coll.drop ()

	val list_aa = dict_aa.toList

	for (pair <- list_aa)
		{
		val key = pair._1
		val unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]
		
		mongo_create_proc (coll,key,unit_aa("name"),
			unit_aa("population").toInt,unit_aa("date_mod"))
		}


	client.close ()

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1161","さいたま",15493,"1998-5-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1162","所沢",61359,"1998-9-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1163","越谷",82193,"1998-2-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1164","久喜",73842,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1165","熊谷",41695,"1998-2-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1166","秩父",69574,"1998-10-27")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1167","川越",31462,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1168","和光",95328,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1169","新座",27135,"1998-10-14")


	dict_aa
}

// --------------------------------------------------------------
def mongo_create_proc
	(coll:MongoCollection[Document],key_in:String,name_in:String,
	population_in:Int,date_mod_in:String)
{
	val doc = new Document("key",key_in).append ("name",name_in).append ("population",population_in).append ("date_mod",date_mod_in)

	coll.insertOne (doc)
}


// --------------------------------------------------------------
}
// --------------------------------------------------------------
