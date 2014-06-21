// ----------------------------------------------------------------
/*
	cdb_create.groovy

					May/30/2013

*/
// ----------------------------------------------------------------
import	java.util.HashMap

// ----------------------------------------------------------------
public static void main (String[] args)
{
	println ("*** 開始 ***")

	def file_cdb = args[0]
		
	def	dict_aa = data_prepare_proc ()

	def ff = new text_manipulate ()
	ff.dict_display_proc (dict_aa)

	def gg = new cdb_manipulate ()

	gg.dict_to_cdb_proc (dict_aa,file_cdb)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
static data_prepare_proc ()
{
	def dict_aa = new HashMap()
	def ff = new text_manipulate ()

	dict_aa = ff.dict_append_proc (dict_aa,"t2761","豊中",91428,"1999-5-2")

	dict_aa = ff.dict_append_proc (dict_aa,"t2762","池田",25716,"1999-4-15")

	dict_aa = ff.dict_append_proc (dict_aa,"t2763","高槻",25367,"1999-3-21")

	dict_aa = ff.dict_append_proc (dict_aa,"t2764","吹田",81324,"1999-9-21")

	dict_aa = ff.dict_append_proc (dict_aa,"t2765","茨木",79531,"1999-8-12")

	dict_aa = ff.dict_append_proc (dict_aa,"t2766","摂津",26529,"1999-7-28")

	dict_aa = ff.dict_append_proc (dict_aa,"t2767","泉大津",37451,"1999-6-19")

	dict_aa = ff.dict_append_proc (dict_aa,"t2768","和泉",87362,"1999-11-15")

	dict_aa = ff.dict_append_proc (dict_aa,"t2769","高石",46872,"1999-10-24")

	return	dict_aa
}
// ----------------------------------------------------------------
