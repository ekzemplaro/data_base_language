// ------------------------------------------------------------------
/*
	text_read.kt

					Dec/04/2017
*/
// ------------------------------------------------------------------
import	java.io.File
import	java.util.HashMap
 
// ------------------------------------------------------------------
fun main(args: Array<String>)
{
	println("*** 開始 ***")

	val file_in = args[0]

	println (file_in)

	val str_in = File(file_in).readText ()

	val dict_aa = str_to_dict_proc (str_in,"\t")

	dict_display_proc (dict_aa)

	println("*** 終了 ***")
}

// ------------------------------------------------------------------
