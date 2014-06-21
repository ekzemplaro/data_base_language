// ----------------------------------------------------------------
/*
	xlsx_manipulate.java
					Jul/30/2013

*/
// ----------------------------------------------------------------
import	java.io.FileInputStream;
import	java.io.FileOutputStream;
import	java.io.IOException;
import	java.util.HashMap;
import	java.util.Set;

import	org.apache.poi.xssf.usermodel.XSSFWorkbook;
import	org.apache.poi.xssf.usermodel.XSSFSheet;
import	org.apache.poi.ss.usermodel.Sheet;
import	org.apache.poi.ss.usermodel.Row;
import	org.apache.poi.ss.usermodel.Cell;
// ----------------------------------------------------------------
public class xlsx_manipulate
{
// ----------------------------------------------------------------
public static HashMap <String, HashMap <String,String>>
	xlsx_read_proc (String xlsx_file) throws IOException
{
	HashMap <String,HashMap <String,String>>
		 dict_aa = new HashMap <String,HashMap <String,String>> ();

	try{
	FileInputStream fi=new FileInputStream (xlsx_file);
	XSSFWorkbook book =new XSSFWorkbook(fi);
	fi.close();

	for(Sheet sheet:book)
		{ // 全シートをなめる
		sheet.setForceFormulaRecalculation(true);// 数式解決
		System.out.println("--- "+sheet.getSheetName()+" ---");
		for(Row row:sheet)
			{ // 全行をなめる
			String key = row.getCell (0).getStringCellValue ();
			String name = row.getCell (1).getStringCellValue ();
//			String str_population = row.getCell (2).getStringCellValue ();
			double dd_population = row.getCell (2).getNumericCellValue ();
			String date_mod = row.getCell (3).getStringCellValue ();


			int population = (int) dd_population;

//			int	population = Integer.parseInt (str_population);

		dict_aa = text_manipulate.dict_append_proc
				(dict_aa,key,name,population,date_mod);

/*
			for(Cell cell:row)
				{ // 全セルをなめる
				System.out.print(getStr(cell)+" ");
				}
			System.out.println("");
*/
			}
		}
	}
	catch(Exception e){
		e.printStackTrace(System.err);
		System.exit(1);
		}

	return	dict_aa;
}
// ----------------------------------------------------------------
static String getStr(Cell cell)
{
	switch (cell.getCellType())
	{
	case Cell.CELL_TYPE_BOOLEAN:
		return Boolean.toString(cell.getBooleanCellValue());
	case Cell.CELL_TYPE_FORMULA:
		return cell.getCellFormula();
			//return cell.getStringCellValue();
	case Cell.CELL_TYPE_NUMERIC:
		return Double.toString(cell.getNumericCellValue());
	case Cell.CELL_TYPE_STRING:
		return cell.getStringCellValue();
	}

      return "";// CELL_TYPE_BLANK,CELL_TYPE_ERROR
}

// ----------------------------------------------------------------
static void xlsx_create_row_proc (XSSFSheet sheet,int row,
	String key,String name,int population,String date_mod)
	throws IOException
{
	Row row1 = sheet.createRow (row);

	Cell cell1_0 = row1.createCell(0);
	cell1_0.setCellValue (key);
	Cell cell1_1 = row1.createCell(1);
	cell1_1.setCellValue (name);
	Cell cell1_2 = row1.createCell(2);
//	cell1_2.setCellValue (str_population);
	cell1_2.setCellValue (population);
	Cell cell1_3 = row1.createCell(3);
	cell1_3.setCellValue (date_mod);
}

// ----------------------------------------------------------------
public static void xlsx_write_proc
	(String xlsx_file,HashMap <String,HashMap <String,String>> dict_aa)
	throws IOException
{
	XSSFWorkbook wb = new XSSFWorkbook();
	FileOutputStream fos = null;

	XSSFSheet sheet1 = wb.createSheet();

	Set set_aaa = dict_aa.keySet ();

	int row = 0;
	for (Object key_aa: set_aaa)
		{
		HashMap <String,String> dict_unit = dict_aa.get (key_aa);

		String str_id = "" + key_aa;
		String name = dict_unit.get ("name");
		String str_population = dict_unit.get ("population");
		int population = Integer.parseInt (str_population);
		String date_mod = dict_unit.get ("date_mod");
		xlsx_create_row_proc
			 (sheet1,row,str_id,name,population,date_mod);
		row++;
		}

	fos = new FileOutputStream (xlsx_file);

	wb.write (fos);
	fos.close();
}

// ----------------------------------------------------------------

}
// ----------------------------------------------------------------
