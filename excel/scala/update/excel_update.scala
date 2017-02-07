// ----------------------------------------------------------------
/*
	excel_update.scala
					Aug/05/2013

*/
// ----------------------------------------------------------------
import	java.util.HashMap 
// ----------------------------------------------------------------
object excel_update
{
// ----------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val excel_file = args(0)
	val key = args(1)
	val population_in = args(2).toInt

	println (key + "\t" + population_in)

	var dict_aa = excel_manipulate.excel_read_proc (excel_file)

	if (dict_aa.contains (key))
		{
		dict_aa = text_manipulate.dict_update_proc (dict_aa,key,population_in)

		excel_manipulate.excel_write_proc (excel_file,dict_aa) 
		}

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")  
  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
