// --------------------------------------------------------------
//	update/riak_update.scala
//
//					Jun/10/2013
// --------------------------------------------------------------
import scala.util.parsing.json.JSON
import scala.util.parsing.json.JSONObject
import	scala.collection.mutable

// --------------------------------------------------------------
object riak_update
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	var	key_in = args(0)
	var	population_in = args(1).toInt
	print ("\tkey_in = " + key_in)
	println ("\tpopulation_in = " + population_in)

	val url_base="http://localhost:8098/riak/shimane"
	val url_target= url_base + "/" + key_in

	val str_json = get_uri.get_uri_proc (url_target)

	println	(str_json)

	val json:Option[Any] = JSON.parseFull(str_json)
	val map_aa:Map[String,Any] = json.get.asInstanceOf[Map[String, Any]]

	val name:String = map_aa.get("name").get.asInstanceOf[String]

	println (name)

	var unit_aa = mutable.Map[String,Object] ()
	unit_aa("name") = name
	unit_aa("population") = "%d".format (population_in)
	val str_ddx = text_manipulate.get_current_date_proc ()
	unit_aa("date_mod") = str_ddx
	val unit_bb = unit_aa.toMap
	val obj = JSONObject (unit_bb)
	val json_str = obj.toString ()
	println (json_str)

	get_uri.rest_put_proc (url_target,json_str,"text/json")

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
