// -----------------------------------------------------------------
//
//	json_read.scala
//
//					Mar/03/2018
//
// -----------------------------------------------------------------
import scala.io.Source

import scala.collection.mutable
// -----------------------------------------------------------------
object json_read
{
// -----------------------------------------------------------------
def main (args: Array[String])
{
	System.err.println	("*** 開始 ***")

	val file_in = args(0)

	var dict_aa = mutable.Map[String,Object] ()

	val str_json = file_io.file_to_str_proc (file_in)


	val keys = Array ("t0921","t0922","t0923",
			"t0924","t0925","t0926",
			"t0927","t0928","t0929",
			"t0930","t0931","t0932",
			"t0933","t0934")

	dict_aa = json_manipulate.json_to_dict_proc (keys,str_json)

	text_manipulate.dict_display_proc (dict_aa)

	System.err.println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
