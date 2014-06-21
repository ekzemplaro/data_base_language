// -----------------------------------------------------------------
//	read/riak_read.scala
//
//						Jun/10/2013
//
// -----------------------------------------------------------------
import scala.util.parsing.json.JSON
import scala.collection.mutable
// -----------------------------------------------------------------
object riak_read {

// -----------------------------------------------------------------
def main( args: Array[String] )
{
	println	("*** 開始 ***")

	val url_base="http://localhost:8098/riak/shimane"
	val url_in= url_base + "?keys=true"

	val str_json = file_io.url_to_str_proc (url_in)
//	println (str_json)

	val json:Option[Any] = JSON.parseFull(str_json)
	val map:Map[String,Any] = json.get.asInstanceOf[Map[String, Any]]
	val keys:List[Any] = map.get("keys").get.asInstanceOf[List[Any]]

	for (key <- keys)
		{
		val url_aa= url_base + "/" + key
		val str_aa = file_io.url_to_str_proc (url_aa)
	//	println (str_aa)
		val json_aa:Option[Any] = JSON.parseFull(str_aa)
		val map_aa:Map[String,Any] = json_aa.get.asInstanceOf[Map[String, Any]]
		val name:String = map_aa.get("name").get.asInstanceOf[String]
		val pop_obj:Object = map_aa.get("population").get.asInstanceOf[Object]
		var population:Double = 0.0
		if (pop_obj.isInstanceOf[String])
			{
			val pop_str:String = pop_obj.toString;
			population = pop_str.toDouble;
			}
		else
			{
			population = map_aa.get("population").get.asInstanceOf[Double]
			}

		val date_mod:String = map_aa.get("date_mod").get.asInstanceOf[String]
		var out_str = key + "\t" + name + "\t" + "%f".format (population)
		println (out_str)
		}

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}

// -----------------------------------------------------------------
