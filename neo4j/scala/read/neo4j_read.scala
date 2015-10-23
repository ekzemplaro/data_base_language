// -----------------------------------------------------------------
//	read/neo4j_read.scala
//
//						Oct/11/2011
//
// -----------------------------------------------------------------
import	scala.util.parsing.json.JSON
import	scala.collection.mutable

// -----------------------------------------------------------------
object neo4j_read {

// -----------------------------------------------------------------
def main( args: Array[String] )
{
	println	("*** 開始 ***")

	val keys = Array ("31","32","33","34","35",
			"36","37","38","39")


	for (key <- keys)
		{	
		val url_in="http://localhost:7474/db/data/node/" + key + "/properties"

		val str_json = get_uri.get_uri_proc (url_in)
//		println	(str_json)
		json_parser (str_json)
		}

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
def json_parser (str_json:String)
{
	var unit_aa = mutable.Map[String,String] ()

	for (tpl <- JSON.parse(str_json).get) {
		tpl match {
		case (t1:String, t2:String) if(t1 == "id") => unit_aa("id") = t2
		case (t1:String, t2:String) if(t1 == "name") => unit_aa("name") = t2
		case (t1:String, t2:Double) if(t1 == "population") => unit_aa("population") = t2.toString ()
		case (t1:String, t2:Int) if(t1 == "population") => unit_aa("population") = t2.toString ()
		case (t1:String, t2:String) if(t1 == "population") => unit_aa("population") = t2
		case (t1:String, t2:String) if(t1 == "date_mod") => unit_aa("date_mod") = t2
		case _ =>
		}
	}

	print (unit_aa("id") + "\t")
	print (unit_aa("name") + "\t")
	print (unit_aa("population") + "\t")
	println (unit_aa("date_mod"))
}

// -----------------------------------------------------------------
}

// -----------------------------------------------------------------
