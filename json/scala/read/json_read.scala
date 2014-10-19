// -----------------------------------------------------------------
//
//	json_read.scala
//
//					Sep/19/2014
//
// -----------------------------------------------------------------
import scala.io.Source
import org.json4s._
import org.json4s.native.JsonMethods._

// -----------------------------------------------------------------
object json_read
{
// -----------------------------------------------------------------
def main (args: Array[String])
{
	println	("*** 開始 ***")

	val file_in = args(0)

	val str_json = file_io.file_to_str_proc (file_in)

	val json = parse(str_json)

	val keys = Array ("t0921","t0922","t0923",
			"t0924","t0925","t0926",
			"t0927","t0928","t0929",
			"t0930","t0931","t0932",
			"t0933","t0934")

	for (key <- keys)
		{
		val unit = json \ key
		if (unit.values != None)
			{
		val name = (unit \ "name").values
		val population = (unit \ "population").values
		val date_mod = (unit \ "date_mod").values
		print (key + "\t")
		print (name + "\t")
		print (population + "\t")
		println (date_mod)
			}
		}

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
