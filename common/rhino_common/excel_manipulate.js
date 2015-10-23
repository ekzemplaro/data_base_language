// ----------------------------------------------------------------
/*
	excel_manipulate.js
					Aug/08/2013

*/
// ----------------------------------------------------------------
importPackage (java.io);
importPackage (java.util);

importPackage (org.apache.poi.hssf.usermodel);
importPackage (org.apache.poi.ss.usermodel);

// ----------------------------------------------------------------
function excel_read_proc (excel_file)
{
	print ("*** excel_read_proc ***");  

	var dict_aa = new Object ();

	var fi=new FileInputStream (excel_file);
	var wb =new HSSFWorkbook(fi);
	fi.close();

	var sheet = wb.getSheetAt(0);

	print ("--- "+ sheet.getSheetName()+" ---");

	sheet.setForceFormulaRecalculation (true);

	for (var row=0; row< 9; row++)
		{
		var rr = sheet.getRow (row);
		if (rr != null)
			{
			var key = rr.getCell (0,Row.RETURN_BLANK_AS_NULL).getStringCellValue ();
			var name = rr.getCell (1,Row.RETURN_BLANK_AS_NULL).getStringCellValue ();
			var population = 0;
			var cell = rr.getCell(2,Row.RETURN_BLANK_AS_NULL)
			var cell_type = cell.getCellType()
			if (cell_type == Cell.CELL_TYPE_NUMERIC)
				{
	population = rr.getCell (2,Row.RETURN_BLANK_AS_NULL).getNumericCellValue();
				}
			else
				{
	population = rr.getCell (2,Row.RETURN_BLANK_AS_NULL).getStringCellValue();
				}
			var date_mod = rr.getCell (3,Row.RETURN_BLANK_AS_NULL).getStringCellValue ();
			if (key != null)
				{
				dict_aa = dict_append_proc
				(dict_aa,key,name,population,date_mod);
				}
			}		
		}

	return	dict_aa;
}

// ----------------------------------------------------------------
function excel_create_row_proc (sheet,row,key,name,population,date_mod)
{
	var row1 = sheet.createRow (row);
	row1.createCell(0).setCellValue(key);
	row1.createCell(1).setCellValue (name);
	row1.createCell(2).setCellValue (population);
	row1.createCell(3).setCellValue (date_mod);
}

// ----------------------------------------------------------------
function excel_write_proc (excel_file,dict_aa)
{
	print ("*** excel_write_proc ***");  

	var wb = new HSSFWorkbook();

	var sheet1 = wb.createSheet();

	var row = 0;

	for (var key in dict_aa)
		{
		var name = dict_aa[key]["name"];
		var population = dict_aa[key]["population"];
		var date_mod = dict_aa[key]["date_mod"];
		excel_create_row_proc (sheet1,row,key,name,population,date_mod)

		row++;
		}

	var fos = new FileOutputStream (excel_file);

	wb.write (fos);
	fos.close();

}

// ----------------------------------------------------------------
