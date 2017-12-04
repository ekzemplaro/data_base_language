// ------------------------------------------------------------------
/*
	text_update.kt

					Dec/04/2017
*/
// ------------------------------------------------------------------
import	java.io.File
import	java.util.HashMap

// ------------------------------------------------------------------
fun main(args: Array<String>)
{
	println("*** 開始 ***")

	val file_txt = args[0]
	val key_in = args[1]
	val population_in = args[2]

	println (file_txt)
	println (key_in)
	println (population_in)

	val delim = "\t"

	val str_in = File(file_txt).readText ()

	var dict_aa = str_to_dict_proc (str_in,delim)

	val today =  get_current_date_proc ()
	println (today)

	val dict_unit = dict_aa.get (key_in)

	dict_unit?.put ("population",population_in)
	dict_unit?.put ("date_mod",today)

	val str_out = dict_to_str_proc (dict_aa,delim)

	File(file_txt).writeText (str_out)

	println("*** 終了 ***")
}

// ------------------------------------------------------------------
