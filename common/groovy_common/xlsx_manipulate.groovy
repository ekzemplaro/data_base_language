// ----------------------------------------------------------------
/*
	xlsx_manipulate.groovy
					Aug/05/2013

*/
// ----------------------------------------------------------------
import	org.apache.poi.xssf.usermodel.XSSFWorkbook
import	org.apache.poi.xssf.usermodel.XSSFSheet
import	org.apache.poi.ss.usermodel.Sheet
import	org.apache.poi.ss.usermodel.Row
import	org.apache.poi.ss.usermodel.Cell

// ----------------------------------------------------------------
public class xlsx_manipulate
{
// ----------------------------------------------------------------
static xlsx_read_proc (xlsx_file)
{
	def dict_aa = new HashMap()

	def fi=new FileInputStream (xlsx_file)
	def wb =new XSSFWorkbook(fi)
	fi.close()

	println ("*** xlsx_read_proc ***")  
  
	Sheet sheet = wb.getSheetAt(0)  
  
	for (row in 0..9)
		{
		def rr = sheet.getRow (row)

		if (rr != null)
			{
			def key = rr.getCell (0,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()
			def name = rr.getCell (1,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()
			def dd_population = rr.getCell (2,Row.RETURN_BLANK_AS_NULL).getNumericCellValue ()
			def date_mod = rr.getCell (3,Row.RETURN_BLANK_AS_NULL).getStringCellValue ()

			def population = dd_population.intValue ()
			def ff = new text_manipulate ()
			dict_aa = ff.dict_append_proc (dict_aa,key,name,population,date_mod)
			}
		}

	return	dict_aa
}

// ----------------------------------------------------------------
static void xlsx_create_row_proc (sheet,row,key,name,population,date_mod)
{
	def row1 = sheet.createRow (row);

	def cell1_0 = row1.createCell(0);
	cell1_0.setCellValue (key);
	def cell1_1 = row1.createCell(1);
	cell1_1.setCellValue (name);
	def cell1_2 = row1.createCell(2);
	cell1_2.setCellValue (population);
	def cell1_3 = row1.createCell(3);
	cell1_3.setCellValue (date_mod);
}

// ----------------------------------------------------------------
public static void xlsx_write_proc (xlsx_file,dict_aa)
{
	def wb = new XSSFWorkbook();

	def sheet1 = wb.createSheet();

	def set_aaa = dict_aa.keySet ();

	def row = 0;
	for (Object key_aa: set_aaa)
		{
		def dict_unit = dict_aa.get (key_aa);

		def str_id = "" + key_aa;
		def name = dict_unit.get ("name");
		String str_population = dict_unit.get ("population");
		int population = Integer.parseInt (str_population);
		def date_mod = dict_unit.get ("date_mod");
		xlsx_create_row_proc (sheet1,row,str_id,name,population,date_mod);
		row++;
		}

	def fos = new FileOutputStream (xlsx_file);

	wb.write (fos);
	fos.close();
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
