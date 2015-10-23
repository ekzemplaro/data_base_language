// ----------------------------------------------------------------
/*
	xlsx_update.scala
					Jul/20/2015

*/
// ----------------------------------------------------------------
import	java.util.HashMap 
// ----------------------------------------------------------------
object xlsx_update
{
// ----------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val xlsx_file = args(0)
	val id_in = args(1)
	val population_in = args(2).toInt

	println (id_in + "\t" + population_in)


	var dict_aa = xlsx_manipulate.xlsx_read_proc (xlsx_file)

	dict_aa = text_manipulate.dict_update_proc (dict_aa,id_in,population_in)

	xlsx_manipulate.xlsx_write_proc (xlsx_file,dict_aa) 

	println ("*** 終了 ***")  
  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
