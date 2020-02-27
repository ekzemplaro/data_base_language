// ------------------------------------------------------------------
/*
	csv_create.kt

					Dec/04/2017
*/
// ------------------------------------------------------------------
import	java.io.File
import	java.util.HashMap

// ------------------------------------------------------------------
fun data_prepare_proc (): HashMap <String, HashMap <String,String>>
{
	var dict_aa = HashMap <String, HashMap <String,String>> ()

	dict_aa["t1271"] = unit_gen_proc ("千葉","69271","1958-3-12")
	dict_aa["t1272"] = unit_gen_proc ("勝浦","32584","1958-8-14")
	dict_aa["t1273"] = unit_gen_proc ("市原","71348","1958-1-7")
	dict_aa["t1274"] = unit_gen_proc ("流山","57213","1958-5-25")
	dict_aa["t1275"] = unit_gen_proc ("八千代","84381","1958-7-18")
	dict_aa["t1276"] = unit_gen_proc ("我孫子","62954","1958-6-4")
	dict_aa["t1277"] = unit_gen_proc ("鴨川","31792","1958-9-12")
	dict_aa["t1278"] = unit_gen_proc ("銚子","19724","1958-12-21")
	dict_aa["t1279"] = unit_gen_proc ("市川","48257","1958-11-8")

	return	dict_aa
}

// ------------------------------------------------------------------
fun main(args: Array<String>)
{
	println("*** 開始 ***")

	val file_out = args[0]

	println (file_out)

	val dict_aa = data_prepare_proc ()

	val str_out = dict_to_str_proc (dict_aa,",")

	File(file_out).writeText (str_out)

	println("*** 終了 ***")
}
 
// ------------------------------------------------------------------
