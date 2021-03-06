// ----------------------------------------------------------------
/*
	xlsx_create.scala
					Jul/20/2015

*/
// ----------------------------------------------------------------
import	java.util.HashMap
import	scala.collection.mutable

// ----------------------------------------------------------------
object xlsx_create
{
// ----------------------------------------------------------------
def main (args: Array[String])
{ 
	println ("*** 開始 ***")

	val xlsx_file = args(0)  
 
	var dict_aa = data_prepare_proc ()

	xlsx_manipulate.xlsx_write_proc (xlsx_file,dict_aa)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2971","奈良",251389,"1998-9-25")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2972","大和高田",497153,"1998-4-23")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2973","大和郡山",921658,"1998-5-24")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2974","天理",893154,"1998-9-14")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2975","橿原",721438,"1998-8-12")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2976","桜井",281563,"1998-7-28")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2977","五條",394527,"1998-6-19")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2978","御所",738621,"1998-11-15")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2979","生駒",651729,"1998-10-24")

	return	dict_aa
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
