// --------------------------------------------------------------
//	update/couch_update.scala
//
//					Jun/23/2014
// --------------------------------------------------------------
import	scala.collection.mutable
import scala.util.parsing.json.JSON
import scala.util.parsing.json.JSONObject
// --------------------------------------------------------------
object couch_update
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	var	key = args(0)
	var	population = args(1).toInt
	print ("\tkey = " + key)
	println ("\tpopulation = " + population)

	val url_collection = "http://localhost:5984/nagano"

	val url_target = url_collection + "/" + key

	val str_json = get_uri.get_uri_proc (url_target)

	println	(str_json)

	val result_aa : Option[Any] = JSON.parseFull (str_json);
	var unit_aa : Map[String, Option[Any]]
			= result_aa.get.asInstanceOf[Map[String, Option[Any]]];

	if (unit_aa.contains ("error"))
		{
		println ("*** not exist ***")
		}
	else
		{
		println ("*** exist ***")
	print (unit_aa("name") + "\t")
		print (unit_aa("population").toString () + "\t")
		println (unit_aa("date_mod"))

	var unit_bb = mutable.Map[String,String] ()
	unit_bb("_rev") = unit_aa("_rev").toString ()
	unit_bb("name") = unit_aa("name").toString ()
	unit_bb("population") = "%d".format (population)
	val str_ddx = text_manipulate.get_current_date_proc ()
	unit_bb("date_mod") = str_ddx
	val unit_cc = unit_bb.toMap
	val obj = JSONObject (unit_cc)
	val json_str_new = obj.toString ()
	println (json_str_new)
	get_uri.rest_put_proc (url_target,json_str_new,"text/json")
		}

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
