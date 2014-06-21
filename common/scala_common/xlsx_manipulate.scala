// ----------------------------------------------------------------
/*
	xlsx_manipulate.scala
					Aug/05/2013

*/
// ----------------------------------------------------------------
import	java.io.File  
import	java.io.FileInputStream
import	java.io.FileOutputStream

import	java.util.HashMap 

import scala.collection.mutable

import	org.apache.poi.xssf.usermodel.XSSFWorkbook
import	org.apache.poi.xssf.usermodel.XSSFSheet
import	org.apache.poi.ss.usermodel.Sheet
import	org.apache.poi.ss.usermodel.Row
import	org.apache.poi.ss.usermodel.Cell

// ----------------------------------------------------------------
object xlsx_manipulate
{
// ----------------------------------------------------------------
def xlsx_read_proc (xlsx_file:String):(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()


	var fi=new FileInputStream (xlsx_file)
	var wb =new XSSFWorkbook(fi)
	fi.close()

//	var sheet = wb.getSheet("Cities")

	var sheet = wb.getSheetAt(0)
	println("--- "+sheet.getSheetName()+" ---")
	sheet.setForceFormulaRecalculation (true)// 数式解決
//	for(Sheet sheet:book)
	for (row <- 0 to 9)
//	for (row <- sheet)
		{
//		println ("row = " + row)

		val rr = sheet.getRow (row)
		if (rr != null)
			{
			val key = rr.getCell (0,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()
			val name = rr.getCell (1,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()
			val dd_population = rr.getCell (2,Row.RETURN_BLANK_AS_NULL).getNumericCellValue ()
			val date_mod = rr.getCell (3,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()

			var	population = (dd_population).toInt
			if (key != null)
				{
				dict_aa = text_manipulate.dict_append_proc (dict_aa,key,name,population,date_mod)
				}
			}
		}

	return	dict_aa
}

// ----------------------------------------------------------------
def xlsx_create_row_proc (sheet: XSSFSheet,row: Int,key:String,name: String,population: Int,date_mod: String)
{
	println ("*** xlsx_create ***")

	val row1 = sheet.createRow (row);
	row1.createCell(0).setCellValue(key)
	row1.createCell(1).setCellValue (name);
	row1.createCell(2).setCellValue (population);
	row1.createCell(3).setCellValue (date_mod);
}

// ----------------------------------------------------------------
def xlsx_write_proc (xlsx_file: String ,dict_aa: mutable.Map[String,Object])
{
	val wb = new XSSFWorkbook();

	val sheet = wb.createSheet("Cities");

	var row = 0;

	for (pair <- dict_aa)
		{
		var unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]

		var key = pair._1.toString ()
		var name = unit_aa ("name")
		var str_population = unit_aa ("population")
		var date_mod = unit_aa ("date_mod")

		var population = str_population.toInt
		xlsx_create_row_proc (sheet,row,key,name,population,date_mod)
		row += 1
		}

	val fos = new FileOutputStream (xlsx_file);

	wb.write (fos);
	fos.close();

}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
