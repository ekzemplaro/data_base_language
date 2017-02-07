// ----------------------------------------------------------------
/*
	excel_delete.groovy
					Aug/07/2013

*/
// ----------------------------------------------------------------
import java.io.File  
import java.io.IOException  


import	java.util.HashMap 
// ----------------------------------------------------------------
public class excel_delete
{
// ----------------------------------------------------------------
public static void main (String[] args)
{
	println ("*** 開始 ***")

	def excel_file = args[0]
	def key = args[1]
	println ("\tkey = " + key)

	def ff = new excel_manipulate ()
	def dict_aa = ff.excel_read_proc (excel_file)

	def gg = new text_manipulate ()

	def dict_bb = gg.dict_delete_proc (dict_aa,key)

	ff.excel_write_proc (excel_file,dict_bb) 

	gg.dict_display_proc (dict_bb)

	println ("*** 終了 ***")  
  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
