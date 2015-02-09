// -----------------------------------------------------------------------
/*
	json_update.scala


					Jan/27/2015
*/
// -----------------------------------------------------------------------
import scala.io.Source
import scala.collection.mutable
// -----------------------------------------------------------------------
object json_update
{

// -----------------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val json_file = args(0)
	val	key_in = args(1)
	val	population = args(2).toInt
	print ("\tkey = " + key_in)
	println ("\tpopulation = " + population)


	val source = Source.fromFile (json_file)
	var str_json = source.mkString
	source.close ()

	val keys = Array ("t0921","t0922","t0923",
			"t0924","t0925","t0926",
			"t0927","t0928","t0929",
			"t0930","t0931","t0932",
			"t0933","t0934")

	var dict_aa = json_manipulate.json_to_dict_proc (keys,str_json)

	dict_aa = text_manipulate.dict_update_proc (dict_aa,key_in,population)

	val json_str = json_manipulate.dict_to_json_proc (dict_aa)

	val out = new java.io.FileWriter (json_file)
	out.write (json_str)
	out.close

	println ("*** 終了 ***")
}

// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
