// -----------------------------------------------------------------------
/*
	json_update.scala


					Sep/18/2014
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
	val	id = args(1)
	val	population = args(2).toInt
	print ("\tid = " + id)
	println ("\tpopulation = " + population)


	val source = Source.fromFile (json_file)
	var str_json = source.mkString
	source.close ()

	var dict_aa = json_manipulate.json_to_dict_proc (str_json)

	dict_aa = text_manipulate.dict_update_proc (dict_aa,id,population)

	val json_str = json_manipulate.dict_to_json_proc (dict_aa)

	val out = new java.io.FileWriter (json_file)
	out.write (json_str)
	out.close

	println ("*** 終了 ***")
}

// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
