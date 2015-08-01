// ----------------------------------------------------------------
/*
	xlsx_delete.scala
					Jul/20/2015

*/
// ----------------------------------------------------------------
import	java.util.HashMap 
// ----------------------------------------------------------------
object xlsx_delete
{
// ----------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val	xlsx_file = args(0)
	val	key = args(1)
	println ("\tkey = " + key)

	var dict_aa = xlsx_manipulate.xlsx_read_proc (xlsx_file)

	val dict_bb = text_manipulate.dict_delete_proc (dict_aa,key)

	xlsx_manipulate.xlsx_write_proc (xlsx_file,dict_bb) 

	println ("*** 終了 ***")  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
