// ------------------------------------------------------------------
/*
	text_create.kt

					Apr/01/2015
*/
// ------------------------------------------------------------------
import	java.io.File
import	java.util.HashMap

// ------------------------------------------------------------------
fun data_prepare_proc (): HashMap <String, HashMap <String,String>>
{
	var dict_aa = HashMap <String, HashMap <String,String>> ()

	dict_aa["t2381"] = unit_gen_proc ("名古屋","35697","1958-7-15")
	dict_aa["t2382"] = unit_gen_proc ("豊橋","62951","1958-9-11")
	dict_aa["t2383"] = unit_gen_proc ("岡崎","92714","1958-4-9")
	dict_aa["t2384"] = unit_gen_proc ("一宮","65723","1958-2-22")
	dict_aa["t2385"] = unit_gen_proc ("蒲郡","27841","1958-8-18")
	dict_aa["t2386"] = unit_gen_proc ("常滑","62384","1958-5-4")
	dict_aa["t2387"] = unit_gen_proc ("大府","35792","1958-1-12")
	dict_aa["t2388"] = unit_gen_proc ("瀬戸","79714","1958-10-21")
	dict_aa["t2389"] = unit_gen_proc ("犬山","69257","1958-11-8")

	return	dict_aa
}

// ------------------------------------------------------------------
fun main(args: Array<String>)
{
	println("*** 開始 ***")

	var file_out = args[0]

	println (file_out)

	var dict_aa = data_prepare_proc ()

	var str_out = dict_to_str_proc (dict_aa,"\t")

	File(file_out).writeText (str_out)

	println("*** 終了 ***")
}
 
// ------------------------------------------------------------------
