// ----------------------------------------------------------------
/*
	cdb_delete.groovy

					May/30/2013

*/
// ----------------------------------------------------------------
public static void main(String[] args)
{
	println ("*** 開始 ***")

	def file_cdb = args[0]

	def key_in = args[1]

	println (key_in)

	def gg = new cdb_manipulate ()
	def dict_aa = gg.cdb_to_dict_proc (file_cdb)

	def ff = new text_manipulate ()

	def dict_bb = ff.dict_delete_proc (dict_aa,key_in)

	ff.dict_display_proc (dict_bb)

	gg.dict_to_cdb_proc (dict_bb,file_cdb)
		
	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
