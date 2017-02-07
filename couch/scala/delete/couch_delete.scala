// --------------------------------------------------------------
//	couch_delete.scala
//
//					Jun/23/2014
// --------------------------------------------------------------
import	scala.collection.mutable
import scala.util.parsing.json.JSON

// --------------------------------------------------------------
object couch_delete
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	var	key_in = args(0)
	println ("\tkey_in = " + key_in)

	val url_collection = "http://localhost:5984/nagano"

	val url_target = url_collection + "/" + key_in

	val str_json = get_uri.get_uri_proc (url_target)

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

		val rev = unit_aa("_rev").toString ()
		val url_del = url_target + "?rev=" + rev
		get_uri.rest_delete_proc (url_del)
		}

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
