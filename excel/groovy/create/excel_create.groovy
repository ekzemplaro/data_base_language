// ----------------------------------------------------------------
/*
	excel_create.groovy
					Aug/07/2013

*/
// ----------------------------------------------------------------
import java.io.File
import java.io.IOException
import java.util.Date  
import jxl.write.WriteException

import	java.util.HashMap
import	java.util.Set
// ----------------------------------------------------------------
class excel_create
{
// ----------------------------------------------------------------
static void main (args)
{ 
	println ("*** 開始 ***")

	def excel_file = args[0]  
 
	def	dict_aa = data_prepare_proc ()

	def ff = new text_manipulate ()
	ff.dict_display_proc (dict_aa)

	def gg = new excel_manipulate ()
	gg.excel_write_proc (excel_file,dict_aa) 

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
static data_prepare_proc ()
{
	def dict_aa = new HashMap ()

	def ff = new text_manipulate ()

	dict_aa = ff.dict_append_proc (dict_aa,"t2971","奈良",51327,"2008-2-15")

	dict_aa = ff.dict_append_proc (dict_aa,"t2972","大和高田",48329,"2008-4-23")

	dict_aa = ff.dict_append_proc (dict_aa,"t2973","大和郡山",91453,"2008-5-24")

	dict_aa = ff.dict_append_proc (dict_aa,"t2974","天理",89147,"2008-9-14")

	dict_aa = ff.dict_append_proc (dict_aa,"t2975","橿原",75924,"2008-8-12")

	dict_aa = ff.dict_append_proc (dict_aa,"t2976","桜井",28567,"2008-7-28")

	dict_aa = ff.dict_append_proc (dict_aa,"t2977","五條",39425,"2008-6-19")

	dict_aa = ff.dict_append_proc (dict_aa,"t2978","御所",43621,"2008-11-15")

	dict_aa = ff.dict_append_proc (dict_aa,"t2979","生駒",58724,"2008-10-24")

	return	dict_aa
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
