// ----------------------------------------------------------------
/*
	cdb_delete.scala

					Jun/12/2015

*/
// ----------------------------------------------------------------
import	java.io.IOException
import	java.util.HashMap

// ----------------------------------------------------------------
object cdb_delete
{
// ----------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val	file_cdb = args(0)
	val	key_in = args(1)

	println ("\tkey_in = " + key_in)

	var dict_aa = cdb_manipulate.cdb_to_dict_proc (file_cdb)

	text_manipulate.dict_delete_proc (dict_aa,key_in)


	cdb_manipulate.dict_to_cdb_proc (dict_aa,file_cdb)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
}

// ----------------------------------------------------------------
