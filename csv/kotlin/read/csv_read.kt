// ------------------------------------------------------------------
/*
	csv_read.kt

					Apr/01/2015
*/
// ------------------------------------------------------------------
import	java.io.File
import	java.util.HashMap
 
// ------------------------------------------------------------------
fun main(args: Array<String>)
{
	println("*** 開始 ***")

	var file_in = args[0]

	println (file_in)

	var str_in = File(file_in).readText ()

	var dict_aa = str_to_dict_proc (str_in,",")

	dict_display_proc (dict_aa)

	println("*** 終了 ***")
}

// ------------------------------------------------------------------
