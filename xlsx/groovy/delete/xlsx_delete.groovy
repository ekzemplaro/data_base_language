// ----------------------------------------------------------------
/*
	xlsx_delete.groovy
					Aug/05/2013

*/
// ----------------------------------------------------------------
import	java.util.HashMap 

// ----------------------------------------------------------------
public class xlsx_delete
{
// ----------------------------------------------------------------
public static void main (String[] args)
{
	println ("*** 開始 ***")

	def xlsx_file = args[0]
	def key = args[1]
	println ("\tkey = " + key)

	def ff = new xlsx_manipulate ()
	def dict_aa = ff.xlsx_read_proc (xlsx_file)

	def gg = new text_manipulate ()
	def dict_bb = gg.dict_delete_proc (dict_aa,key)

	ff.xlsx_write_proc (xlsx_file,dict_bb) 

	gg.dict_display_proc (dict_bb)

	println ("*** 終了 ***")  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
