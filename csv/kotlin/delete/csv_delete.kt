// ------------------------------------------------------------------
/*
	csv_delete.kt

					Apr/01/2015
*/
// ------------------------------------------------------------------
import	java.io.File
import	java.util.HashMap

// ------------------------------------------------------------------
fun main(args: Array<String>)
{
	println("*** 開始 ***")

	var file_txt = args[0]
	var key_in = args[1]

	println (file_txt)
	println (key_in)

	val delim = ","

	var str_in = File(file_txt).readText ()

	var dict_aa = str_to_dict_proc (str_in,delim)

	if (dict_aa.containsKey (key_in)) {
		println ("*** key exists. ***")
		dict_aa.remove (key_in)
		var str_out = dict_to_str_proc (dict_aa,delim)
		File(file_txt).writeText (str_out)
		}
	else {
		println ("*** key doen't exist. ***")
		}

	println("*** 終了 ***")
}

// ------------------------------------------------------------------
