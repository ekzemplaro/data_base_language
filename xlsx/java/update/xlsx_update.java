// ----------------------------------------------------------------
/*
	xlsx_update.java
					Jul/30/2013

*/
// ----------------------------------------------------------------
import	java.io.IOException;

import	java.util.HashMap; 
// ----------------------------------------------------------------
public class xlsx_update
{
// ----------------------------------------------------------------
public static void main (String[] args)
	throws IOException
//	throws IOException, BiffException, WriteException
{
	System.out.println ("*** 開始 ***");

	String excel_file = args[0];
	String	id = args[1];
	int	population = Integer.parseInt (args[2]);
	System.out.print ("\tid = " + id);
	System.out.println ("\tpopulation = " + population);

	HashMap <String,HashMap <String,String>> dict_aa
		= xlsx_manipulate.xlsx_read_proc (excel_file);

	text_manipulate.dict_update_proc (dict_aa,id,population);

	xlsx_manipulate.xlsx_write_proc (excel_file,dict_aa); 

	text_manipulate.dict_display_proc (dict_aa);

	System.out.println ("*** 終了 ***");  
  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
