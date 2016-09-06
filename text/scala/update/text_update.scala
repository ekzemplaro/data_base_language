// -----------------------------------------------------------------
//	text_update.scala
//
//						Sep/05/2016
// -----------------------------------------------------------------
import scala.io.Source
import scala.collection.mutable

// -----------------------------------------------------------------
object text_update
{
// -----------------------------------------------------------------
def main (args: Array[String])
{
	System.err.println ("*** 開始 ***")

	val file_in = args(0)
	val key_in = args(1)
	val population_in = args(2).toInt

	println (key_in + "\t" + population_in)

	var dict_aa = text_manipulate.text_read_proc (file_in)

	dict_aa = text_manipulate.dict_update_proc (dict_aa,key_in,population_in)

	text_manipulate.text_write_proc (file_in,dict_aa)

	System.err.println ("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
