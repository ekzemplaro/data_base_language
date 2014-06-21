// ----------------------------------------------------------------
/*
	excel_delete.java
					Jul/05/2011

*/
// ----------------------------------------------------------------
import java.io.File;  
import java.io.IOException;  

import jxl.read.biff.BiffException;
import jxl.write.WriteException;

import	java.util.HashMap; 
// ----------------------------------------------------------------
public class excel_delete
{
// ----------------------------------------------------------------
public static void main (String[] args)
	throws IOException, BiffException, WriteException
{
	System.out.println ("*** 開始 ***");

	String excel_file = args[0];
	String	id = args[1];
	System.out.println ("\tid = " + id);

	HashMap <String,HashMap <String,String>> dict_aa
		= excel_manipulate.excel_read_proc (excel_file);

	text_manipulate.dict_delete_proc (dict_aa,id);

	excel_manipulate.excel_write_proc (excel_file,dict_aa); 

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");  
  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
