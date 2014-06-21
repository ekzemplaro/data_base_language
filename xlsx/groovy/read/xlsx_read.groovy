// ----------------------------------------------------------------
/*
	xlsx_read.groovy
					Aug/05/2013

*/
// ----------------------------------------------------------------
class xlsx_read
{
// ----------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def xlsx_file = args[0]

	def ff = new xlsx_manipulate ()
	def dict_aa = ff.xlsx_read_proc (xlsx_file)

	def gg = new text_manipulate ()
	gg.dict_display_proc (dict_aa)

	println ("*** 終了 ***")  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
