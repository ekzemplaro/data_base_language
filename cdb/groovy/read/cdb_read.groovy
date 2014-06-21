// ----------------------------------------------------------------
/*
	cdb_read.groovy

					May/30/2013

*/
// ----------------------------------------------------------------
public static void main(String[] args)
{
	println ("*** 開始 ***")

	def file_cdb = args[0]

	def gg = new cdb_manipulate ()
	def dict_aa = gg.cdb_to_dict_proc (file_cdb)

	def ff = new text_manipulate ()
	ff.dict_display_proc (dict_aa)
		
	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
