// -----------------------------------------------------------------
//	text_update.scala
//
//						Jun/03/2011
// -----------------------------------------------------------------
import scala.io.Source
import scala.collection.mutable

// -----------------------------------------------------------------
object text_update
{
// -----------------------------------------------------------------
def main (args: Array[String])
{
	println	("*** 開始 ***")

	val file_in = args(0)
	val id_in = args(1)
	val population_in = args(2).toInt

	println (id_in + "\t" + population_in)

	var dict_aa = text_manipulate.text_read_proc (file_in)

	dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in)
	text_manipulate.dict_display_proc (dict_aa)

	text_manipulate.text_write_proc (file_in,dict_aa)

	println	("*** 終了 ***")
}


// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
