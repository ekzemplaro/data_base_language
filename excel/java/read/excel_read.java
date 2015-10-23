// ----------------------------------------------------------------
/*
	excel_read.java
					Apr/15/2011

*/
// ----------------------------------------------------------------
import java.io.File;  
import java.io.IOException;  
import jxl.Workbook;
import jxl.Sheet;
import jxl.Cell;
import jxl.read.biff.BiffException;

import	java.util.HashMap; 
// ----------------------------------------------------------------
public class excel_read
{
// ----------------------------------------------------------------
public static void main (String[] args)
	throws IOException, BiffException
{
	System.out.println ("*** 開始 ***");

	String excel_file = args[0];

	HashMap <String,HashMap <String,String>> dict_aa
		= excel_manipulate.excel_read_proc (excel_file);

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");  
  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
