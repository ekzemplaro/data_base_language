// ----------------------------------------------------------------
/*
	xlsx_update.java
					Jul/20/2015

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
{
	System.out.println ("*** 開始 ***");

	String excel_file = args[0];
	String	key_in = args[1];
	int	population = Integer.parseInt (args[2]);
	System.out.print ("\tkey_in = " + key_in);
	System.out.println ("\tpopulation = " + population);

	HashMap <String,HashMap <String,String>> dict_aa
		= xlsx_manipulate.xlsx_read_proc (excel_file);

	text_manipulate.dict_update_proc (dict_aa,key_in,population);

	xlsx_manipulate.xlsx_write_proc (excel_file,dict_aa); 

	System.out.println ("*** 終了 ***");  
  
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
