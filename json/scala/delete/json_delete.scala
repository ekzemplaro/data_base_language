// -----------------------------------------------------------------------
/*
	json_delete.scala


					Sep/18/2014
*/
// -----------------------------------------------------------------------
import scala.io.Source
import scala.collection.mutable
// -----------------------------------------------------------------------
object json_delete
{

// -----------------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val	json_file = args(0)
	val	key_in = args(1)

	println ("\tkey_in = " + key_in)

	val source = Source.fromFile (json_file)
	var str_json = source.mkString
	source.close()

	var dict_aa = json_manipulate.json_to_dict_proc (str_json)

	if (dict_aa.contains (key_in))
		{
		dict_aa = text_manipulate.dict_delete_proc (dict_aa,key_in)

		val json_str = json_manipulate.dict_to_json_proc (dict_aa)

		val out = new java.io.FileWriter (json_file)
		out.write (json_str)
		out.close
		}

	println ("*** 終了 ***")
}

// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
