// ----------------------------------------------------------------
/*
	xlsx_manipulate.js
					Nov/09/2015

*/
// ----------------------------------------------------------------
importPackage (java.io)
importPackage (java.util)

importPackage (org.apache.poi.xssf.usermodel)
importPackage (org.apache.poi.ss.usermodel)

// ----------------------------------------------------------------
function xlsx_read_proc (xlsx_file)
{
	print ("*** xlsx_read_proc ***")  

	var dict_aa = new Object ()

	try
		{
	var fi=new FileInputStream (xlsx_file)
	var wb =new XSSFWorkbook(fi)
	fi.close()
		}
	catch (ee) {
		print ("*** error *** xlsx_read_proc ***")
		print (ee)
		}

	var sheet = wb.getSheetAt(0)

	print ("--- "+ sheet.getSheetName()+" ---")

	sheet.setForceFormulaRecalculation (true)

	for (var row=0; row< 9; row++)
		{
		var rr = sheet.getRow (row)
		if (rr != null)
			{
			var key = rr.getCell (0,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()
			var name = rr.getCell (1,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()
			var population = rr.getCell (2,Row.RETURN_BLANK_AS_NULL).getNumericCellValue ()
			var date_mod = rr.getCell (3,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()
			if (key != null)
				{
				dict_aa = dict_append_proc
				(dict_aa,key,name,population,date_mod)
				}
			}		
		}

	return	dict_aa
}

// ----------------------------------------------------------------
function xlsx_create_row_proc (sheet,row,key,name,population,date_mod)
{
	var row1 = sheet.createRow (row)
	row1.createCell(0).setCellValue(key)
	row1.createCell(1).setCellValue (name)
	row1.createCell(2).setCellValue (population)
	row1.createCell(3).setCellValue (date_mod)
}

// ----------------------------------------------------------------
function xlsx_write_proc (xlsx_file,dict_aa)
{
	print ("*** xlsx_write_proc ***")  

	var wb = new XSSFWorkbook()

	var sheet1 = wb.createSheet()

	var row = 0

	for (var key in dict_aa)
		{
		var name = dict_aa[key]["name"]
		var population = dict_aa[key]["population"]
		var date_mod = dict_aa[key]["date_mod"]
		xlsx_create_row_proc (sheet1,row,key,name,population,date_mod)

		row++
		}

	var fos = new FileOutputStream (xlsx_file)

	wb.write (fos)
	fos.close()

}

// ----------------------------------------------------------------
