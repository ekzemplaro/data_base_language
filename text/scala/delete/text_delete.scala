// -----------------------------------------------------------------
//	text_delete.scala
//
//						Sep/05/2016
// -----------------------------------------------------------------
import scala.io.Source
import scala.collection.mutable

// -----------------------------------------------------------------
object text_delete
{
// -----------------------------------------------------------------
def main (args: Array[String])
{
	System.err.println ("*** 開始 ***")

	val file_in = args(0)
	val key_in = args(1)

	println (key_in)

	var doc_aa = text_manipulate.text_read_proc (file_in)

	val doc_bb = text_manipulate.dict_delete_proc (doc_aa,key_in)

	text_manipulate.text_write_proc (file_in,doc_aa)

	System.err.println ("*** 終了 ***")
}

// -----------------------------------------------------------------
}
// -----------------------------------------------------------------
