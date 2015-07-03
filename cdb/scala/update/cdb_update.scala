// ----------------------------------------------------------------
/*
	cdb_update.scala

					Jun/12/2015

*/
// ----------------------------------------------------------------
import	java.io.IOException
import	java.util.HashMap

// ----------------------------------------------------------------
object cdb_update
{
// ----------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val	file_cdb = args(0)
	val	key = args(1)
	val	population_in = args(2).toInt

	println (key + "\t" + population_in)

	var dict_aa = cdb_manipulate.cdb_to_dict_proc (file_cdb)

	text_manipulate.dict_update_proc (dict_aa,key,population_in)

	text_manipulate.dict_display_proc (dict_aa)

	cdb_manipulate.dict_to_cdb_proc (dict_aa,file_cdb)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
}

// ----------------------------------------------------------------
