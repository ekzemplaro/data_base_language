// -----------------------------------------------------------------
//	read/couch_read.scala
//
//						May/07/2015
//
// -----------------------------------------------------------------
import scala.util.parsing.json.JSON
// -----------------------------------------------------------------
object couch_read {

// -----------------------------------------------------------------
def main( args: Array[String] )
{
	println	("*** 開始 ***")

	val url_collection = "http://localhost:5984/nagano"
	val url_all_docs = url_collection + "/_all_docs?include_docs=true"

	val str_json = file_io.url_to_str_proc (url_all_docs)

	val result : Option[Any] = JSON.parseFull(str_json);
	val map : Map[String, Option[Any]]
		= result.get.asInstanceOf[Map[String, Option[Any]]];
	println (map.get("total_rows").get.toString ());

val rows:List[Map[String, Option[Any]]]
	= map.get("rows").get.asInstanceOf[List[Map[String, Option[Any]]]]

	rows.foreach (bbb =>
		{
		val key = bbb("key").toString ()
		val url_target = url_collection + "/" + key;
		val str_unit = file_io.url_to_str_proc (url_target)

//		val str_unit = bbb("doc").toString ()
//		println	(str_unit)
		val result_aa : Option[Any] = JSON.parseFull(str_unit);
		val unit_aa : Map[String, Option[Any]]
			= result_aa.get.asInstanceOf[Map[String, Option[Any]]];

//		var result_aa : Option[Any] = bbb("doc")
//		var unit_aa : Map[String, Option[Any]] = bbb("doc")
/*
		var unit_aa : Map[String, Option[Any]]
			= result_aa.get.asInstanceOf[Map[String, Option[Any]]];
*/
		print (key + "\t")
		print (unit_aa("name") + "\t")
		print (unit_aa("population") + "\t")
		println (unit_aa("date_mod"))

		})

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}

// -----------------------------------------------------------------
