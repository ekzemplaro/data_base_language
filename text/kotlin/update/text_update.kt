// ------------------------------------------------------------------
/*
	text_update.kt

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
	var population_in = args[2]

	println (file_txt)
	println (key_in)
	println (population_in)

	var delim = "\t"

	var str_in = File(file_txt).readText ()

	var dict_aa = str_to_dict_proc (str_in,delim)

	var today =  get_current_date_proc ()
	println (today)

	dict_aa[key_in]["population"] = population_in
	dict_aa[key_in]["date_mod"] = today

	var str_out = dict_to_str_proc (dict_aa,delim)

	File(file_txt).writeText (str_out)

	println("*** 終了 ***")
}

// ------------------------------------------------------------------
