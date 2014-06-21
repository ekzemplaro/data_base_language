// ----------------------------------------------------------------
/*
	excel_read.scala
					Aug/01/2013

*/
// ----------------------------------------------------------------
import java.io.IOException  

import	java.util.HashMap 
// ----------------------------------------------------------------
object excel_read
{
// ----------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val excel_file = args(0).toString ()

	var dict_aa = excel_manipulate.excel_read_proc (excel_file)

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")  
  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
