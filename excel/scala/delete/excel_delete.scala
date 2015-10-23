// ----------------------------------------------------------------
/*
	excel_delete.scala
					Jul/05/2011

*/
// ----------------------------------------------------------------
import	java.util.HashMap 
// ----------------------------------------------------------------
object excel_delete
{
// ----------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val excel_file = args(0)
	val	id = args(1)
	println ("\tid = " + id)

	var dict_aa = excel_manipulate.excel_read_proc (excel_file)

	val dict_bb = text_manipulate.dict_delete_proc (dict_aa,id)

	excel_manipulate.excel_write_proc (excel_file,dict_bb) 

	text_manipulate.dict_display_proc (dict_bb)

	println ("*** 終了 ***")  
  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
