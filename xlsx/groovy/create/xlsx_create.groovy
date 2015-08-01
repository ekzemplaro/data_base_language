// ----------------------------------------------------------------
/*
	xlsx_create.groovy
					Jul/20/2015

*/
// ----------------------------------------------------------------
import	java.util.HashMap

// ----------------------------------------------------------------
class xlsx_create
{
// ----------------------------------------------------------------
static void main (args)
{ 
	println ("*** 開始 ***")

	def	xlsx_file = args[0]  
 
	def	dict_aa = data_prepare_proc ()

	def ff = new text_manipulate ()
	ff.dict_display_proc (dict_aa)

	def gg = new xlsx_manipulate ()
	gg.xlsx_write_proc (xlsx_file,dict_aa) 

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
static data_prepare_proc ()
{
	def dict_aa = new HashMap ()

	def ff = new text_manipulate ()

	dict_aa = ff.dict_append_proc (dict_aa,"t2971","奈良",324197,"1999-7-25")

	dict_aa = ff.dict_append_proc (dict_aa,"t2972","大和高田",416297,"1999-4-23")

	dict_aa = ff.dict_append_proc (dict_aa,"t2973","大和郡山",982453,"1999-5-24")

	dict_aa = ff.dict_append_proc (dict_aa,"t2974","天理",891547,"1999-9-14")

	dict_aa = ff.dict_append_proc (dict_aa,"t2975","橿原",751824,"1999-8-12")

	dict_aa = ff.dict_append_proc (dict_aa,"t2976","桜井",185927,"1999-7-28")

	dict_aa = ff.dict_append_proc (dict_aa,"t2977","五條",391425,"1999-6-19")

	dict_aa = ff.dict_append_proc (dict_aa,"t2978","御所",438621,"1999-11-15")

	dict_aa = ff.dict_append_proc (dict_aa,"t2979","生駒",583724,"1999-10-24")

	return	dict_aa
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
