// ----------------------------------------------------------------
/*
	excel_manipulate.java
					May/17/2011

*/
// ----------------------------------------------------------------
import java.io.File;  
import java.io.IOException;  
import jxl.Workbook;
import jxl.Sheet;
import jxl.Cell;
import jxl.read.biff.BiffException;

import jxl.write.Label;   
import jxl.write.WriteException;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;


import	java.util.HashMap; 
import	java.util.Set; 
// ----------------------------------------------------------------
public class excel_manipulate
{
// ----------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
	excel_read_proc (String excel_file)
	throws IOException, BiffException
{
	HashMap <String,HashMap <String,String>>
		 dict_aa = new HashMap <String,HashMap <String,String>> ();

	Workbook workbook = Workbook.getWorkbook (new File(excel_file));    
  
	Sheet sheet = workbook.getSheet(0);  
  
	for (int row=0; row<9; row++)
		{
		try
			{
		String str_id = sheet.getCell (0,row).getContents ();
		String name = sheet.getCell (1,row).getContents ();
		String str_population = sheet.getCell (2,row).getContents ();
		String date_mod = sheet.getCell (3,row).getContents ();

//		int	id = Integer.parseInt (str_id);
		int	population = Integer.parseInt (str_population);

		dict_aa = text_manipulate.dict_append_proc
				(dict_aa,str_id,name,population,date_mod);

			}
		catch (Exception ee)
			{
//			ee.printStackTrace ();
			break;
			}

		}

	return	dict_aa;
}

// ----------------------------------------------------------------
static void excel_create_row_proc
	(WritableSheet sheet,int row,String str_id,String name,String str_population,String date_mod)
	throws WriteException
{
	Label label_aa = new Label (0,row,str_id);
	sheet.addCell (label_aa);

	Label label_bb = new Label (1,row,name);
	sheet.addCell (label_bb);

	Label label_cc = new Label (2,row,str_population);
	sheet.addCell (label_cc);

	Label label_dd = new Label (3,row,date_mod);
	sheet.addCell (label_dd);
}

// ----------------------------------------------------------------
public static void excel_write_proc
	(String excel_file,HashMap <String,HashMap <String,String>> dict_aa)
	throws IOException,WriteException
{
	WritableWorkbook workbook = Workbook.createWorkbook
				(new File(excel_file));  
	WritableSheet sheet = workbook.createSheet("First Sheet", 0);  

	Set set_aaa = dict_aa.keySet ();

	int row = 0;
	for (Object key_aa: set_aaa)
		{
		HashMap <String,String> dict_unit = dict_aa.get (key_aa);

		String str_id = "" + key_aa;
		String name = dict_unit.get ("name");
		String str_population = dict_unit.get ("population");
		String date_mod = dict_unit.get ("date_mod");
		excel_create_row_proc
			 (sheet,row,str_id,name,str_population,date_mod);
		row++;
		}


	workbook.write();
	workbook.close();

}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
