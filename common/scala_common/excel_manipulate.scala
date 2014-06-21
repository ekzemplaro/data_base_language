// ----------------------------------------------------------------
/*
	excel_manipulate.scala
					Jul/05/2011

*/
// ----------------------------------------------------------------
import java.io.File  
import java.io.IOException  
import jxl.Workbook
import jxl.Sheet
import jxl.Cell
import jxl.read.biff.BiffException

import jxl.write.Label   
import jxl.write.WriteException
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook


import	java.util.HashMap 
import	java.util.Set 

import scala.collection.mutable

// ----------------------------------------------------------------
object excel_manipulate
{
// ----------------------------------------------------------------
def	excel_read_proc (excel_file:String):(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	var workbook = Workbook.getWorkbook (new File(excel_file))    
  
	var sheet = workbook.getSheet(0)  
  
	for (row <- 0 to 9)
		{
		try
			{
		var str_id = sheet.getCell (0,row).getContents ()
		var name = sheet.getCell (1,row).getContents ()
		var str_population = sheet.getCell (2,row).getContents ()
		var date_mod = sheet.getCell (3,row).getContents ()

		var	population = Integer.parseInt (str_population)

		dict_aa = text_manipulate.dict_append_proc (dict_aa,str_id,name,population,date_mod)

			}
		catch
			{
			case ee:Exception  => -1
			}

		}

	return	dict_aa
}

// ----------------------------------------------------------------
def excel_create_row_proc (sheet: WritableSheet,row: Int,str_id:String,name: String,str_population: String,date_mod: String)
{
	var label_aa = new Label (0,row,str_id)
	sheet.addCell (label_aa)

	var label_bb = new Label (1,row,name)
	sheet.addCell (label_bb)

	var label_cc = new Label (2,row,str_population)
	sheet.addCell (label_cc)

	var label_dd = new Label (3,row,date_mod)
	sheet.addCell (label_dd)
}

// ----------------------------------------------------------------
def excel_write_proc
	(excel_file: String ,dict_aa: mutable.Map[String,Object])
{
println ("*** excel_write_proc *** start *** " + excel_file)

	var workbook = Workbook.createWorkbook (new File(excel_file))  

	var sheet = workbook.createSheet("First Sheet", 0)  

	var row = 0

	for (pair <- dict_aa)
		{
		var unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]

		var str_id = pair._1.toString ()
		var name = unit_aa ("name")
		var str_population = unit_aa ("population")
		var date_mod = unit_aa ("date_mod")
		excel_create_row_proc (sheet,row,str_id,name,str_population,date_mod)
		row += 1
		}

	workbook.write()
	workbook.close()
println ("*** excel_write_proc *** end ***")
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
