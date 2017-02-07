// ----------------------------------------------------------------
/*
	excel_read.groovy
					Jul/05/2011

*/
// ----------------------------------------------------------------
class excel_read
{
// ----------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def excel_file = args[0]

	def ff = new excel_manipulate ()
	def dict_aa = ff.excel_read_proc (excel_file)

	def gg = new text_manipulate ()
	gg.dict_display_proc (dict_aa)

	println ("*** 終了 ***")  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
