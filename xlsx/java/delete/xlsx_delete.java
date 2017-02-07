// ----------------------------------------------------------------
/*
	xlsx_delete.java
					Jul/20/2015

*/
// ----------------------------------------------------------------
import java.io.IOException;  

import	java.util.HashMap; 
// ----------------------------------------------------------------
public class xlsx_delete
{
// ----------------------------------------------------------------
public static void main (String[] args) throws IOException
{
	System.out.println ("*** 開始 ***");

	String excel_file = args[0];
	String	key = args[1];
	System.out.println ("\tkey = " + key);

	HashMap <String,HashMap <String,String>> dict_aa
		= xlsx_manipulate.xlsx_read_proc (excel_file);

	text_manipulate.dict_delete_proc (dict_aa,key);

	xlsx_manipulate.xlsx_write_proc (excel_file,dict_aa); 

	System.out.println ("*** 終了 ***");  
  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
