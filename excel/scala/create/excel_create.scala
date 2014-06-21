// ----------------------------------------------------------------
/*
	excel_create.scala
					Jul/05/2011

*/
// ----------------------------------------------------------------
import	java.util.HashMap;
import scala.collection.mutable

// ----------------------------------------------------------------
object excel_create
{
// ----------------------------------------------------------------
def main (args: Array[String])
{ 
	println ("*** 開始 ***")

	val excel_file = args(0)  
 
	var dict_aa = data_prepare_proc ()

	text_manipulate.dict_display_proc (dict_aa)

	excel_manipulate.excel_write_proc (excel_file,dict_aa) 

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2971","奈良",51273,"1998-2-15")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2972","大和高田",49165,"1998-4-23")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2973","大和郡山",92153,"1998-5-24")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2974","天理",89154,"1998-9-14")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2975","橿原",72138,"1998-8-12")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2976","桜井",28563,"1998-7-28")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2977","五條",39427,"1998-6-19")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2978","御所",73621,"1998-11-15")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2979","生駒",68729,"1998-10-24")

	return	dict_aa
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
