// -----------------------------------------------------------------
//	text_delete.scala
//
//						Jun/03/2011
// -----------------------------------------------------------------
import scala.io.Source
import scala.collection.mutable

// -----------------------------------------------------------------
object text_delete
{
// -----------------------------------------------------------------
def main (args: Array[String])
{
	println	("*** 開始 ***")

	val file_in = args(0)
	val id_in = args(1)

	println (id_in)

	var doc_aa = text_manipulate.text_read_proc (file_in)

	val doc_bb = text_manipulate.dict_delete_proc (doc_aa,id_in)

	text_manipulate.text_write_proc (file_in,doc_aa)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
