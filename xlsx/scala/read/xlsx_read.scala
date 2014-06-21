// ----------------------------------------------------------------
/*
	xlsx_read.scala
					Aug/05/2013

*/
// ----------------------------------------------------------------
import	java.util.HashMap 

import	scala.collection.mutable
// ----------------------------------------------------------------
object xlsx_read
{
// ----------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val xlsx_file = args(0).toString ()

	var dict_aa = xlsx_manipulate.xlsx_read_proc (xlsx_file)

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")  
  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
