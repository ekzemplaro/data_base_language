// ----------------------------------------------------------------
/*
	excel_update.groovy
					Apr/19/2011

*/
// ----------------------------------------------------------------
import java.io.File  
import java.io.IOException  
import jxl.Workbook
import jxl.Sheet
import jxl.Cell
import jxl.read.biff.BiffException

import jxl.write.WriteException

import	java.util.HashMap 
// ----------------------------------------------------------------
class excel_update
{
// ----------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def excel_file = args[0]
	def id_in=args[1]
	def population_in=args[2]
	println (id_in + "\t" +  population_in)


	def ff = new excel_manipulate ()

	def dict_aa = ff.excel_read_proc (excel_file)

	def gg = new text_manipulate ()

	gg.dict_update_proc (dict_aa,id_in,population_in)

	ff.excel_write_proc (excel_file,dict_aa) 

	gg.dict_display_proc (dict_aa)

	println ("*** 終了 ***")  
  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
